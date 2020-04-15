<?php require 'includes/header_start.php'; ?>
<!--Morris Chart CSS -->
<link rel="stylesheet" href="assets/plugins/morris/morris.css">
<link rel="stylesheet" type="text/css" href="intro.css">
<style type="text/css">
  .introjs-helperLayer {
    background: transparent;
}

.introjs-overlay {
    opacity: 0 !important;
}

.introjs-helperLayer:before {
    opacity: 0;
    content: '';
    position: fixed;
    width: inherit;
    height: inherit;
    border-radius: 0.5em;
    box-shadow: 0 0 0 1000em rgba(0,0,0, .7);
    opacity: 1;
}

.introjs-helperLayer:after {
    content: '';
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    position: fixed;
    z-index: 1000;
}
</style>

<?php require 'includes/header_end.php'; ?>
<script src="assets/js/jquery.min.js"></script>

<script type="text/javascript" src="match.js"></script>
    <script type="text/javascript">
     $(document).ready(function(){
       $(function() {
        $('.items').matchHeight({
          byRow: true,
          property: 'height',
          target: null,
          remove: false
      });
      });
     });
    </script>



<!-- ============================================================== -->
<!-- Start right Content here -->
<!-- ============================================================== -->
<div class="content-page">
    <!-- Start content -->
    <div class="content">
        <div class="container">

            <div class="row">
                <div class="col-xs-12">
                    <div class="page-title-box">
                        <h4 class="page-title">Dashboard <button class="btn btn-sm btn-success" onclick="javascript:introJs().start();">Take a Tour</button></h4>
                        <ol class="breadcrumb p-0">                           
                            <li> <a href="#"><?php echo $pdo_auth['name']; ?></a> </li>
                            <li class="active">  Dashboard  </li>
                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
           
            <?php  see_status2($_REQUEST); ?>

            
            <div class="row">
                <div class="col-xl-5 col-lg-5 col-md-12">
                  <div class="row">
                            <div class="col-xs-12 col-md-12">
                                <div class="card-box tilebox-one">
                                    <i class="icon-layers pull-xs-right text-muted"></i>
                                    <h6 class="text-muted text-uppercase m-b-20">Wallet Balance</h6>
                                    <h2 class="m-b-20" data-plugin="counterup"><?php  echo round( $pdo_auth['balance'],2); ?></h2>
                                    <span class="label label-success"> <?php echo $pdo_auth['name']; ?> </span> <span class="text-muted">No Recent Records</span>
                                </div>
                            </div>

                           

                            <div class="col-xs-12 col-md-12">
                                <a href="transfer.php">
                                  <div class="card-box tilebox-one">
                                      <i class="icon-rocket pull-xs-right text-muted"></i>
                                      <h6 class="text-muted text-uppercase m-b-20">Carbon Credits</h6>                                         
                                      <h2 class="m-b-20" data-plugin="counterup"><?php echo round( $pdo_auth['carbon_credits'],2);  ?></h2>
                                      <span class="label label-warning"> All Time </span> <span class="text-muted">No Recent Records</span>
                                  </div>
                                </a>
                            </div>

                            <div class="col-xs-12 col-md-12">
                                <a href="transfer.php">
                                  <div class="card-box tilebox-one">
                                      <i class="icon-rocket pull-xs-right text-muted"></i>
                                      <h6 class="text-muted text-uppercase m-b-20">Energy Credits</h6>                                         
                                      <h2 class="m-b-20" data-plugin="counterup"><?php echo round( $pdo_auth['energy_credits'],2);  ?></h2>
                                      <span class="label label-warning"> All Time </span> <span class="text-muted">No Recent Records</span>
                                  </div>
                                </a>
                            </div>
                        </div>
                </div><!-- end col-->

                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                  <div class="card-box items" style="height:500px;">
                    <div style="padding: 20px"></div>
                         <center> <img src="profile/<?php echo $pdo_auth['file']; ?>" style="width: 150px;;border-radius: 50%">

                         <div style="padding:7px;"></div>
                          <div class="century" style="font-weight: bold;font-size: 24px;color: #79a4ec;text-transform: uppercase;"><?php echo $pdo_auth['name']; ?></div>
                          <div>Khalids Energy Wallet Holder</div>
                          
                          <hr style="width: 60%;opacity: .1" />
                           <a href="" class="btn btn-primary btn-sm btn-primary" data-toggle="modal" data-target="#myModal" data-step="3" data-intro="You can Update Profile Here" data-position='right' >Update Profile</a>
                          <a href="change_photo.php"><button class="btn btn-sm btn-success"  data-step="2" data-intro="Here You can Change Your Profile Photo " >Update Photo</button></a>

                         
                          <div style="padding:3px;"></div>
                          <div style="font-size:12px;color: #444;">Last Visited on <?php echo date("D-m-y : H:i:s"); ?></div>
                          <hr style="opacity: .1" />
                           
                          <b class="century" style="color: #33aece">Account Address : </b>
                          <div style="color: #999;word-wrap:break-word;width:170px"><?php echo $pdo_auth['tx_address']; ?></div>
                          <div style="padding:8px;"></div>                            
                        </div>
                </div>

                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                    <div class="card-box items" style="height: 500px" >
                        <h4 class="header-title m-t-0 m-b-20">Frequently Asked Questions</h4> <hr/>
                        <div style="padding: 10px;"></div>

                        <div class="panel-group" id="accordion">
                  			  <div class="panel panel-default">
                  			    <div class="panel-heading" style="padding:10px;border:solid 1px #eee;">
                  			      <h4 class="panel-title" style="font-size:18px">
                  			        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                  			        Question 1 : What do I need to create a Blockchain Wallet?</a>
                  			      </h4>
                  			    </div>
                  			    <div id="collapse1" class="panel-collapse collapse in" style="padding:10px;">
                  			      <div class="panel-body">Creating a free Blockchain Wallet is quick and easy. All you need is a valid email address and a secure password.</div>
                  			    </div>
                  			  </div>
                  			  <div class="panel panel-default">
                  			    <div class="panel-heading" style="padding:10px;border:solid 1px #eee;">
                  			      <h4 class="panel-title" style="font-size:18px">
                  			        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                  			         Question2 : What is an address?</a>
                  			      </h4>
                  			    </div>
                  			    <div id="collapse2" class="panel-collapse collapse" style="padding:10px;border:solid 1px #eee;">
                  			      <div class="panel-body">Addresses are strings of letters and numbers, that are used to send you funds. For increased privacy, a new bitcoin address is generated for every transaction. Find the address for your next transaction by clicking Request in your wallet.</div>
                  			    </div>
                  			  </div>
                  			  
                  			  <div class="panel panel-default">
                  			    <div class="panel-heading" style="padding:10px;border:solid 1px #eee;">
                  			      <h4 class="panel-title" style="font-size:18px">
                  			        <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">
                  			         Question3 : Are there fees?</a>
                  			      </h4>
                  			    </div>
                  			    <div id="collapse4" class="panel-collapse collapse" style="padding:10px;border:solid 1px #eee;">
                  			      <div class="panel-body">Yes. Transaction fees cover the mining network fees and the Blockchain infrastructure necessary to ensure fast and reliable transaction confirmation times. Miners prioritize transactions based on fees, so the higher the fee, the greater chance your transaction has of being completed quickly. A fee that’s too low runs the risk of never being confirmed. </div>
                  			    </div>
                  			  </div>
                  			  
                  			  
                  			  <div class="panel panel-default">
                  			    <div class="panel-heading" style="padding:10px;border:solid 1px #eee;">
                  			      <h4 class="panel-title" style="font-size:18px" >
                  			        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                  			         Question 4:   What happens if my transaction is not completed?</a>
                  			      </h4>
                  			    </div>
                  			    <div id="collapse3" class="panel-collapse collapse" style="padding:10px;border:solid 1px #eee;">
                  			      <div class="panel-body">If your transaction is rejected, the funds will remain in the sender’s wallet.</div>
                  			    </div>
                  			  </div>

                           <div class="panel panel-default">
                            <div class="panel-heading" style="padding:10px;border:solid 1px #eee;">
                              <h4 class="panel-title" style="font-size:18px" >
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">
                                 How can I keep my wallet secure?</a>
                              </h4>
                            </div>
                            <div id="collapse6" class="panel-collapse collapse" style="padding:10px;border:solid 1px #eee;">
                              <div class="panel-body">When you create a Blockchain wallet, we recommend you use strong Password which could not be guessed.</div>
                            </div>
                          </div>
                			</div>

                    </div>
                </div><!-- end col-->


            </div>
            <!-- end row -->
              <?php  
        $data = file_get_contents("http://ropsten.etherscan.io/api?module=account&action=txlist&address=0x26caf09e2494e40c9b9af780596e6c55fa53674a&startblock=0&endblock=99999999&sort=asc&apikey=KN6UV25CEHMII57MUZ9BNZPTG8IXPNJF71");
               // $data = file_get_contents("http://api.etherscan.io/api?module=account&action=txlist&address=0x6addcfc2c792396f460679a83c0136cb5b8e64f1&startblock=0&endblock=99999999&sort=asc&apikey=KN6UV25CEHMII57MUZ9BNZPTG8IXPNJF71");         
                  $mata = json_decode($data, true);
                  $pata = array_reverse($mata['result']);
            $count =  count($pata);            
        ?>

            <div class="row">
                <div class="col-xs-12 col-lg-12 col-xl-12">
                   
                        <div class="card-box">
                                <h4 class="header-title m-t-0 m-b-20">Blockchain Transactions</h4>

                                <table class="table table-hover table-striped" id="example">
                  <thead>
                    <tr>
                      <th style="color:#bbb">#</th>
                      <th style="color:#bbb">Wallet Address</th>
                      <th style="color:#bbb">Tx Pair</th>
                      <th style="color:#bbb">TValue</th>
                      <th style="color:#bbb">Status</th>
                    </tr>
                  </thead>
                  <tbody>

                    <?php 
                     function humanTiming ($time)
                      {
              
                          $time = time() - $time; // to get the time since that moment
                          $time = ($time<1)? 1 : $time;
                          $tokens = array (
                              31536000 => 'year',
                              2592000 => 'month',
                              604800 => 'week',
                              86400 => 'day',
                              3600 => 'hour',
                              60 => 'minute',
                              1 => 'second'
                          );
              
                          foreach ($tokens as $unit => $text) {
                              if ($time < $unit) continue;
                              $numberOfUnits = floor($time / $unit);
                              return $numberOfUnits.' '.$text.(($numberOfUnits>1)?'s':'');
                          }
              
                      }
                    $i=1;
                    $non_zero = array();

                    $array1 = array();
                    $array2 = array();
                    $array3 = array();
                    $array4 = array();
                    $array5 = array();

                     for($i=0;$i<$count;$i++){
                        $current_time = date("U");
                        $timestamp = $pata[$i]['timeStamp'];

                         $marak = ($pata[$i]['value']/1000000000000000000);
                        // echo $current_time;
                        $secs = number_format((($current_time-$timestamp)/3600),2); 

                        if($marak!=0){
                          $non_zero[] = ($pata[$i]['value']/1000000000000000000);
                        }

                        if($marak>0 && $marak<1){ $array1[]=$marak; }
                        if($marak>1 && $marak<3){ $array2[]=$marak; }
                        if($marak>3 && $marak<4){ $array3[]=$marak; }
                        if($marak>4 && $marak<5){ $array4[]=$marak; }
                        if($marak>5){ $array5[]=$marak; }
                        
                         $status =  '<label class="label label-primary">Success</label>'; 
                        if($pata[$i]['txreceipt_status']==0){
                            $status =  '<label class="label label-danger">Failed</label>';
                          } 
                          
                                                 
                        echo '<tr>
                              <td>'.$i.'</td>
                              <td title="'.$pata[$i]['hash'].'">'.$pata[$i]['hash'].' <br/>  <label class="label label-primary">Block : '.$pata[$i]['blockNumber'].'</label> <label class="label label-success">'.humanTiming ($timestamp).' Ago</label></td>
                              <td> <b>From : </b>'.$pata[$i]['from'].'<br/>
                                        <b>To : </b>'.$pata[$i]['to'].' </td>
                              <td>'.$marak.'</td>
                              <td>'.$status.'</td>
                            </tr>'; 
                      }

                      //print_r($array5);
                      $non_zero = array_reverse($non_zero);
                     // print_r();
                     ?>                                     
                  </tbody>
                </table>

                            
                    </div>
                </div><!-- end col-->
            </div>
            <!-- end row -->


        </div> <!-- container -->

    </div> <!-- content -->


</div>
<!-- End content-page -->


<!-- ============================================================== -->
<!-- End Right content here -->
<!-- ============================================================== -->


<?php require 'includes/footer_start.php' ?>


<!-- Page specific js -->
<script src="assets/pages/jquery.dashboard.js"></script>


<script type="text/javascript" src="intro.js"></script>
<?php require 'includes/footer_end.php' ?>
