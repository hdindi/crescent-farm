<?php
$this->load->view('header');
?>
<div id="add_employee"></div>


<div>
    <ul class="breadcrumb">
        <li>
            <a href="<?php base_url(); ?>crescenthome">Home</a> <span class="divider">/</span>
        </li>
        <li>
            <a href="<?php base_url(); ?>crescenthome">Dashboard</a>
        </li>
    </ul>
</div>


<div class="sortable row-fluid">
    <a data-rel="tooltip" title="Total Members" class="well span3 top-block" href="#">
        <span class="icon32 icon-red icon-user"></span>
        <div>Total Number of  Users</div>
        <div id="member_list"></div>
        <span class="notification">6</span>
    </a>
    <a data-rel="tooltip" title="Total Branches" class="well span3 top-block" href="#">
        <span class="icon32 icon-color icon-cart"></span>
        <div>Total Employees To-Date</div>
        <div id="branch_list"></div>
        <span class="notification yellow">$34</span>
    </a>

    <a data-rel="tooltip" title="Total Employees" class="well span3 top-block" href="#">
        <span class="icon32 icon-color icon-star-on"></span>
        <div>Total Units</div>
        <div id="employee_list"></div>
        <span class="notification green">4</span>
    </a>



    <a data-rel="tooltip" title="Total Patients" class="well span3 top-block" href="#">
        <span class="icon32 icon-color icon-envelope-closed"></span>
        <div>Total Drivers</div>
        <div id="patient_list"></div>
        <span class="notification red">12</span>
    </a>
</div>

<div class="row-fluid">
    <div class="box span12">
        <div class="box-header well">
            <h2><i class="icon-info-sign"></i> Administration</h2>
            <div class="box-icon">
                <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <p><b>Welcome to the  Administration Page of Crescent Farm Enterprises</b></p>

            <p class="center">

            </p>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<div class="row-fluid sortable">
    <div class="box span4">
        <div class="box-header well">
            <h2><i class="icon-th"></i> Users</h2>
            <div class="box-icon">
                <a href="#" class="btn btn-setting btn-round"><i class="icon-plus-sign"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <!--<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>-->
            </div>
        </div>
        <div class="box-content">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active"><a href="#info">Users Info</a></li>
                <li><a href="#custom">Add Users</a></li>
                <li><a href="#messages">View All Users</a></li>
            </ul>

            <div id="myTabContent" class="tab-content">
                <div class="tab-pane active" id="info">
                    <h3>Charisma <small>a fully featued template</small></h3>

                    <p>Its a fully featured, responsive template for your admin panel. Its optimized for tablet and mobile phones. Scan the QR code below to view it in your mobile device.</p> <img alt="QR Code" class="charisma_qr center" src="img/qrcode136.png" />


                </div>
                <div class="tab-pane" id="custom">
                    <h3>Custom <small>small text</small></h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at. Nulla tellus elit, varius non commodo eget, mattis vel eros. In sed ornare nulla. Donec consectetur, velit a pharetra ultricies, diam lorem lacinia risus, ac commodo orci erat eu massa. Sed sit amet nulla ipsum. Donec felis mauris, vulputate sed tempor at, aliquam a ligula. Pellentesque non pulvinar nisi.</p>
                </div>
                <div class="tab-pane" id="messages">
                    <h3>Messages <small>small text</small></h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at. Nulla tellus elit, varius non commodo eget, mattis vel eros. In sed ornare nulla. Donec consectetur, velit a pharetra ultricies, diam lorem lacinia risus, ac commodo orci erat eu massa. Sed sit amet nulla ipsum. Donec felis mauris, vulputate sed tempor at, aliquam a ligula. Pellentesque non pulvinar nisi.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor.</p>
                </div>
            </div>
        </div>
    </div><!--/span-->

    <div class="box span4">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-user"></i> Member Activity</h2>
            <div class="box-icon">
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <div class="box-content">
                <ul class="dashboard-list">
                    <li>
                        <a href="#">
                            <img class="dashboard-avatar" alt="Usman" src="http://www.gravatar.com/avatar/<?php echo md5(strtolower(trim("usman@halalit.net"))); ?>.png?s=50"></a>
                        <strong>Name:</strong> <a href="#">Usman
                        </a><br>
                        <strong>Since:</strong> 17/05/2012<br>
                        <strong>Status:</strong> <span class="label label-success">Approved</span>                                  
                    </li>
                    <li>
                        <a href="#">
                            <img class="dashboard-avatar" alt="Sheikh Heera" src="http://www.gravatar.com/avatar/<?php echo md5(strtolower(trim("heerasheikh@ymail.com"))); ?>.png?s=50"></a>
                        <strong>Name:</strong> <a href="#">Sheikh Heera
                        </a><br>
                        <strong>Since:</strong> 17/05/2012<br>
                        <strong>Status:</strong> <span class="label label-warning">Pending</span>                                 
                    </li>
                    <li>
                        <a href="#">
                            <img class="dashboard-avatar" alt="Abdullah" src="http://www.gravatar.com/avatar/<?php echo md5(strtolower(trim("abdullah123456@abc.com"))); ?>.png?s=50"></a>
                        <strong>Name:</strong> <a href="#">Abdullah
                        </a><br>
                        <strong>Since:</strong> 25/05/2012<br>
                        <strong>Status:</strong> <span class="label label-important">Banned</span>                                  
                    </li>
                    <li>
                        <a href="#">
                            <img class="dashboard-avatar" alt="Saruar Ahmed" src="http://www.gravatar.com/avatar/<?php echo md5(strtolower(trim("saruarall@gmail.com"))); ?>.png?s=50"></a>
                        <strong>Name:</strong> <a href="#">Saruar Ahmed
                        </a><br>
                        <strong>Since:</strong> 17/05/2012<br>
                        <strong>Status:</strong> <span class="label label-info">Updates</span>                                  
                    </li>
                </ul>
            </div>
        </div>
    </div><!--/span-->

    <div class="box span4">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-list-alt"></i> Realtime Traffic</h2>
            <div class="box-icon">
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <div id="realtimechart" style="height:190px;"></div>
            <p class="clearfix">You can update a chart periodically to get a real-time effect by using a timer to insert the new data in the plot and redraw it.</p>
            <p>Time between updates: <input id="updateInterval" type="text" value="" style="text-align: right; width:5em"> milliseconds</p>
        </div>
    </div><!--/span-->
</div><!--/row-->

<div class="row-fluid sortable">
    <div class="box span4">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-list"></i> Buttons</h2>
            <div class="box-icon">
                <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content buttons">
            <p class="btn-group">
                <button class="btn">Left</button>
                <button class="btn">Middle</button>
                <button class="btn">Right</button>
            </p>
            <p>
                <button class="btn btn-small"><i class="icon-star"></i> Icon button</button>
                <button class="btn btn-small btn-primary">Small button</button>
                <button class="btn btn-small btn-danger">Small button</button>
            </p>
            <p>
                <button class="btn btn-small btn-warning">Small button</button>
                <button class="btn btn-small btn-success">Small button</button>
                <button class="btn btn-small btn-info">Small button</button>
            </p>
            <p>
                <button class="btn btn-small btn-inverse">Small button</button>
                <button class="btn btn-large btn-primary btn-round">Round button</button>
                <button class="btn btn-large btn-round"><i class="icon-ok"></i></button>
                <button class="btn btn-primary"><i class="icon-edit icon-white"></i></button>
            </p>
            <p>
                <button class="btn btn-mini">Mini button</button>
                <button class="btn btn-mini btn-primary">Mini button</button>
                <button class="btn btn-mini btn-danger">Mini button</button>
                <button class="btn btn-mini btn-warning">Mini button</button>
            </p>
            <p>
                <button class="btn btn-mini btn-info">Mini button</button>
                <button class="btn btn-mini btn-success">Mini button</button>
                <button class="btn btn-mini btn-inverse">Mini button</button>
            </p>
        </div>
    </div><!--/span-->

    <div class="box span4">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-list"></i> Buttons</h2>
            <div class="box-icon">
                <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content  buttons">
            <p>
                <button class="btn btn-large">Large button</button>
                <button class="btn btn-large btn-primary">Large button</button>
            </p>
            <p>
                <button class="btn btn-large btn-danger">Large button</button>
                <button class="btn btn-large btn-warning">Large button</button>
            </p>
            <p>
                <button class="btn btn-large btn-success">Large button</button>
                <button class="btn btn-large btn-info">Large button</button>
            </p>
            <p>
                <button class="btn btn-large btn-inverse">Large button</button>
            </p>
            <div class="btn-group">
                <button class="btn btn-large">Large Dropdown</button>
                <button class="btn btn-large dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="#"><i class="icon-star"></i> Action</a></li>
                    <li><a href="#"><i class="icon-tag"></i> Another action</a></li>
                    <li><a href="#"><i class="icon-download-alt"></i> Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#"><i class="icon-tint"></i> Separated link</a></li>
                </ul>
            </div>

        </div>
    </div><!--/span-->

    <div class="box span4">
        <div class="box-header well" data-original-title>
            <h2><i class="icon-list"></i> Weekly Stat</h2>
            <div class="box-icon">
                <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
            </div>
        </div>
        <div class="box-content">
            <ul class="dashboard-list">
                <li>
                    <a href="#">
                        <i class="icon-arrow-up"></i>                               
                        <span class="green">92</span>
                        New Comments                                    
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-arrow-down"></i>
                        <span class="red">15</span>
                        New Registrations
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-minus"></i>
                        <span class="blue">36</span>
                        New Articles                                    
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-comment"></i>
                        <span class="yellow">45</span>
                        User reviews                                    
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-arrow-up"></i>                               
                        <span class="green">112</span>
                        New Comments                                    
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-arrow-down"></i>
                        <span class="red">31</span>
                        New Registrations
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-minus"></i>
                        <span class="blue">93</span>
                        New Articles                                    
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon-comment"></i>
                        <span class="yellow">254</span>
                        User reviews                                    
                    </a>
                </li>
            </ul>
        </div>
    </div><!--/span-->
</div><!--/row-->




<?php
//include('footer.php'); 
$this->load->view('footer');
?>
