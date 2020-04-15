<?php require 'includes/header_start.php'; ?>
<!--Morris Chart CSS -->
<link rel="stylesheet" href="assets/plugins/morris/morris.css">
<?php require 'includes/header_end.php'; ?>


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
                        <h4 class="page-title">Withdraw <?php echo token_names(); ?></h4>
                        <ol class="breadcrumb p-0">
                           
                            <li>
                                <a href="#"><?php echo wallet_names(); ?></a>
                            </li>
                            <li class="active">
                                Withdraw Tokens
                            </li>
                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
           

            <?php  see_status2($_REQUEST); ?>
            <div class="row">               

                <div class="col-xl-6 col-xs-12">
                    <div class="card-box items">
                      <div style="padding: 10px;"></div>
                        <div class="century" style="font-size: 24px;color: #444">WITHDRAW <?php echo token_names(); ?></div>
                        <div class="century" style="font-size: 12px;color: #444">You can Withdraw Tokens from KEM Wallet anytime When You Require</div>
                        <hr style="opacity: 1" />
                      
                        
                       <center>
                         <form method="POST" action="withdraw_handle.php">
                           <div class="form-group" style="text-align: left;color: #444;">
                            <label>Wallet Balance</label><br/>

                              <input type="number" min="0" class="form-control" value="<?php echo $pdo_auth['balance']; ?>" disabled  placeholder="Your Wallet Ballance">
                           </div>
                           

                           <div class="form-group" style="text-align: left;color: #444;">
                            <label>Tokens to Withdraw</label><br/>
                              <input type="text" class="form-control"  name="token_no"  placeholder="Token to Withdraw">
                           </div>
                          
                          
                           <div class="form-group" style="text-align: left;color: #444;">
                             <label>Withdraw Wallet Address</label><br/>
                              <input type="text" class="form-control"  name="withdraw_wallet_address"  placeholder="Withdraw Wallet Address">
                              <div style="font-size: 11px;color: cream;padding-top:20px;">Make Sure You Enter Correct Withdraw Address, Token Once Transferred cannot be Recovered any how, So Please Make Sure You are Entering Correct Token Address To withdraw</div>
                           </div>
                          

                           <button class="btn btn-primary btn-lg" style="width: 100%">WITHDRAW TOKENS</button>
                         </form>
                         <div style="padding: 10px;"></div>
                         <div style="color: #444;">*KEM Fee : Fee: 0.5% of the total amount or 0.5 KEM </div>
                       </center>

                       <div style="padding:10px;"></div>
                    
                   </div>
                </div><!-- end col-->


                <div class="col-xl-6 col-xs-12">
                    <div class="card-box items">
                        <h4 class="header-title m-t-0 m-b-20">Things to be kept in mind before Withdrwaing <?php echo token_names(); ?> to Your Etrhereum Wallet Address</h4>
                         <h3  style="font-family: 'Didact Gothic', sans-serif;font-weight:bold;color:#3445bf;font-size: 20px;">Caution! </h3>
                         <h4  style="font-family: 'Didact Gothic', sans-serif;color: #777;font-size: 16px;">Please use the following while Withdrawing in to ETH Token account:</h4>
                         <hr/>
                         <ul style="font-family: 'Didact Gothic', sans-serif;color: #444;font-size: 14px;">
                            <li style="padding: 4px;"> Ensure that your KEM Token Address ID and the associated Sender ID are correct.</li>
                            <li style="padding: 4px;"> Ensure that there are no white spaces in the KEM Token ID and the Sender ID.</li>
                            <li style="padding: 4px;">Ensure that there are no white spaces while you enter the dynamic access code.</li>
                            <li style="padding: 4px;">In case of any other difficulty, contact KEM Token Support</li>                            
                         </ul>

                         <p>If you have done everything correctly, the next screen will show you your new public wallet address which you will need to receive your <?php echo token_names(); ?>. If you receive an error of any kind, please start again and repeat until you fully understood this process. </p>
                    </div>
                </div><!-- end col-->


            </div>
           

        </div> <!-- container -->

    </div> <!-- content -->


</div>
<!-- End content-page -->


<!-- ============================================================== -->
<!-- End Right content here -->
<!-- ============================================================== -->


<?php require 'includes/footer_start.php' ?>

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
<!-- Page specific js -->
<script src="assets/pages/jquery.dashboard.js"></script>    
<?php require 'includes/footer_end.php' ?>
