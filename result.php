<?php
session_start();
error_reporting(0);
include('includes/config.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Result Management System</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen">
    <link rel="stylesheet" href="css/prism/prism.css" media="screen">
    <link rel="stylesheet" href="css/main.css" media="screen">
    <script src="js/modernizr/modernizr.min.js"></script>
</head>

<body>
    <div class="main-wrapper">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Student Result Management System</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
                </ul>
            </div>
        </nav>

        <div class="content-wrapper">
            <div class="content-container">
                <div class="main-page">
                    <div class="container-fluid">
                        <div class="row page-title-div">
                            <div class="col-md-12">
                                <h2 class="title text-center">Result Management System</h2>
                            </div>
                        </div>
                    </div>

                    <section class="section" id="exampl">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <div class="panel">
                                        <div class="panel-heading">
                                            <div class="panel-title text-center">
                                                <h3>Student Result Details</h3>
                                                <hr />
                                                <?php
$rollid = $_POST['rollid'];
$classid = $_POST['class'];
$_SESSION['rollid'] = $rollid;
$_SESSION['classid'] = $classid;

$qery = "SELECT tblstudents.StudentName,tblstudents.RollId,tblstudents.RegDate,tblstudents.StudentId,
                tblstudents.Status,tblclasses.ClassName,tblclasses.Section 
         FROM tblstudents 
         JOIN tblclasses ON tblclasses.id=tblstudents.ClassId 
         WHERE tblstudents.RollId=:rollid AND tblstudents.ClassId=:classid";
$stmt = $dbh->prepare($qery);
$stmt->bindParam(':rollid', $rollid, PDO::PARAM_STR);
$stmt->bindParam(':classid', $classid, PDO::PARAM_STR);
$stmt->execute();
$resultss = $stmt->fetchAll(PDO::FETCH_OBJ);

if ($stmt->rowCount() > 0) {
    foreach ($resultss as $row) {
?>
                                                <p><b>Student Name:</b> <?php echo htmlentities($row->StudentName); ?>
                                                </p>
                                                <p><b>Student Registration ID:</b>
                                                    <?php echo htmlentities($row->RollId); ?>
                                                </p>
                                                <p><b>Student Class:</b> <?php echo htmlentities($row->ClassName); ?>
                                                    (<?php echo htmlentities($row->Section); ?>)</p>
                                                <?php } ?>
                                            </div>
                                            <div class="panel-body p-20">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading text-center">
                                                        <h3 class="panel-title"><i class="fa fa-user-circle"></i>
                                                            Welcome, <?php echo htmlentities($row->StudentName); ?>!
                                                        </h3>
                                                    </div>
                                                    <div class="panel-body text-center">
                                                        <p>🎓 Hello
                                                            <b><?php echo htmlentities($row->StudentName); ?></b>,
                                                            welcome to your
                                                            <b>Student Result Management Portal</b>.
                                                        </p>
                                                        <p>Here’s a quick overview of your academic performance below.
                                                        </p>
                                                    </div>
                                                </div>

                                                <table class="table table-hover table-bordered" border="1" width="100%">
                                                    <thead>
                                                        <tr style="text-align: center">
                                                            <th style="text-align: center">#</th>
                                                            <th style="text-align: center">Subject</th>
                                                            <th style="text-align: center">Marks</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php
$query = "SELECT t.StudentName,t.RollId,t.ClassId,t.marks,SubjectId,tblsubjects.SubjectName 
          FROM (SELECT sts.StudentName,sts.RollId,sts.ClassId,tr.marks,SubjectId 
                FROM tblstudents AS sts 
                JOIN tblresult AS tr ON tr.StudentId=sts.StudentId) AS t 
          JOIN tblsubjects ON tblsubjects.id=t.SubjectId 
          WHERE (t.RollId=:rollid AND t.ClassId=:classid)";
$query = $dbh->prepare($query);
$query->bindParam(':rollid', $rollid, PDO::PARAM_STR);
$query->bindParam(':classid', $classid, PDO::PARAM_STR);
$query->execute();
$results = $query->fetchAll(PDO::FETCH_OBJ);
$cnt = 1;
$totlcount = 0;

if ($countrow = $query->rowCount() > 0) {
    foreach ($results as $result) {
?>
                                                        <tr>
                                                            <th scope="row" style="text-align: center">
                                                                <?php echo htmlentities($cnt); ?></th>
                                                            <td style="text-align: center">
                                                                <?php echo htmlentities($result->SubjectName); ?></td>
                                                            <td style="text-align: center">
                                                                <?php echo htmlentities($totalmarks = $result->marks); ?>
                                                            </td>
                                                        </tr>
                                                        <?php
        $totlcount += $totalmarks;
        $cnt++;
    }
?>
                                                        <tr>
                                                            <th scope="row" colspan="2" style="text-align: center">Total
                                                                Marks</th>
                                                            <td style="text-align: center">
                                                                <b><?php echo htmlentities($totlcount); ?></b> out of
                                                                <b><?php echo htmlentities($outof = ($cnt - 1) * 100); ?></b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th scope="row" colspan="2" style="text-align: center">
                                                                Percentage</th>
                                                            <td style="text-align: center">
                                                                <b><?php echo htmlentities(round($totlcount * (100) / $outof, 2)); ?>%</b>
                                                            </td>
                                                        </tr>

                                                        <!-- ✅ ADD RANKING SECTION BELOW -->
                                                        <?php
        // Get the current student's database ID
        $studentIdQuery = "SELECT StudentId FROM tblstudents WHERE RollId=:rollid AND ClassId=:classid";
        $studentStmt = $dbh->prepare($studentIdQuery);
        $studentStmt->bindParam(':rollid', $rollid, PDO::PARAM_STR);
        $studentStmt->bindParam(':classid', $classid, PDO::PARAM_STR);
        $studentStmt->execute();
        $studentData = $studentStmt->fetch(PDO::FETCH_OBJ);
        $studentId = $studentData->StudentId;

        // Calculate ranks for all students in the same class
        $rankQuery = "SELECT StudentId, SUM(marks) AS totalMarks 
                      FROM tblresult 
                      WHERE ClassId = :classid 
                      GROUP BY StudentId 
                      ORDER BY totalMarks DESC";
        $rankStmt = $dbh->prepare($rankQuery);
        $rankStmt->bindParam(':classid', $classid, PDO::PARAM_STR);
        $rankStmt->execute();
        $rankResults = $rankStmt->fetchAll(PDO::FETCH_ASSOC);

        $rank = 0;
        $studentRank = 0;
        $totalStudents = count($rankResults);

        foreach($rankResults as $r) {
            $rank++;
            if($r['StudentId'] == $studentId) {
                $studentRank = $rank;
                break;
            }
        }
        ?>
                                                        <tr>
                                                            <th scope="row" colspan="2" style="text-align: center">Class
                                                                Position</th>
                                                            <td style="text-align: center">
                                                                <b><?php echo $studentRank; ?></b> out of
                                                                <b><?php echo $totalStudents; ?></b>
                                                            </td>
                                                        </tr>
                                                        <!-- ✅ END RANKING SECTION -->

                                                    </tbody>
                                                </table>

                                                <div class="panel panel-success">
                                                    <div class="panel-heading text-center">
                                                        <h4><i class="fa fa-line-chart"></i> Performance Summary</h4>
                                                    </div>
                                                    <div class="panel-body text-center">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <h5><i class="fa fa-book"></i> Total Subjects</h5>
                                                                <p><b><?php echo htmlentities($cnt - 1); ?></b></p>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <h5><i class="fa fa-calculator"></i> Total Marks</h5>
                                                                <p><b><?php echo htmlentities($totlcount); ?></b> /
                                                                    <?php echo htmlentities($outof); ?></p>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <h5><i class="fa fa-percent"></i> Percentage</h5>
                                                                <p><b><?php echo htmlentities(round($totlcount * (100) / $outof, 2)); ?>%</b>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="alert alert-success text-center" role="alert">
                                                    <i class="fa fa-trophy"></i>
                                                    <strong>Your Position:</strong> <?php echo $studentRank; ?> /
                                                    <?php echo $totalStudents; ?> students.
                                                    <br>
                                                    <i class="fa fa-lightbulb-o"></i>
                                                    <strong>Keep going,
                                                        <?php echo htmlentities($row->StudentName); ?>!</strong>
                                                </div>

                                                <tr>
                                                    <td colspan="3" align="center">
                                                        <i class="fa fa-print fa-2x" aria-hidden="true"
                                                            style="cursor:pointer" OnClick="CallPrint(this.value)"></i>
                                                    </td>
                                                </tr>

                                                <?php } else { ?>
                                                <div class="alert alert-warning left-icon-alert" role="alert">
                                                    <strong>Notice!</strong> Your result has not been declared yet.
                                                </div>
                                                <?php } ?>
                                                <?php
} else {
?>
                                                <div class="alert alert-danger left-icon-alert" role="alert">
                                                    <strong>Oh snap!</strong> Invalid Roll Id.
                                                </div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    </section>
                </div>
            </div>
        </div>
    </div>

    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <script src="js/pace/pace.min.js"></script>
    <script src="js/lobipanel/lobipanel.min.js"></script>
    <script src="js/iscroll/iscroll.js"></script>
    <script src="js/prism/prism.js"></script>
    <script src="js/main.js"></script>
    <script>
    function CallPrint(strid) {
        var prtContent = document.getElementById("exampl");
        var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
        WinPrint.document.write(prtContent.innerHTML);
        WinPrint.document.close();
        WinPrint.focus();
        WinPrint.print();
    }
    </script>
</body>

</html>