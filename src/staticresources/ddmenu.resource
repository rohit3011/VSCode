


/* GLOBALS */

*,
*:after,
*:before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    padding: 0;
    margin: 0;
}
/*
::selection {
    background: transparent; 
}

::-moz-selection {
    background: transparent; 
}
*/
.wrapper-demo {
    margin: 0px 0 0 0;
    *zoom: 1;
    font-weight: 400;
	float:left;
	margin-left:10px;
	
}

.wrapper-demo:after {
    clear: both;
    content: "";
    display: table;
}



/* DEMO 4 */

.wrapper-dropdown-4 {
    /* Size and position */
    position: relative;
    width: 270px;
    padding: 5px 10px 5px 10px;

    /* Styles */
    background: #f7f7f7;
    border: 1px solid #ccc;
    cursor: pointer;
    outline: none;
}

.wrapper-dropdown-4:after {
    content: "";
    width: 0;
    height: 0;
    position: absolute;
    right: 10px;
    top: 50%;
    margin-top: -3px;
    border-width: 6px 6px 0 6px;
    border-style: solid;
    border-color: #009fe2 transparent;
}

.wrapper-dropdown-4 .dropdown {
    /* Size & position */
    position: absolute;
    top: 100%;
    margin-top: 1px;
    left: -1px;
    right: -1px;

    /* Styles */
    background: #f7f7f7;
    border: inherit;
    border-top: none;
    list-style: none;
    -webkit-transition: all 0.3s ease-out;
    -moz-transition: all 0.3s ease-out;
    -ms-transition: all 0.3s ease-out;
    -o-transition: all 0.3s ease-out;
    transition: all 0.3s ease-out;
  
    /* Hiding */
    opacity: 0;
	display:none;
    filter: alpha(opacity:0);
    pointer-events: none;
}
.wrapper-dropdown-4 .dropdown p{
	padding:3px 15px;
}
.wrapper-dropdown-4 .dropdown select
{
	width:240px;
padding-left:10px;
border:1px solid #ccc !important;;
-webkit-border-radius:1px;
-moz-border-radius:1px;
border-radius:1px;
height:25px;

/*-webkit-appearance: none;*/        /*Removes default chrome and safari style*/
/*-moz-appearance: none !important;*/          /* Removes Default Firefox style*/
/*appearance: none;*/
/*background: #fff url(../images/select-drop-down-arrow.png) no-repeat;*/         /*Adds background-image*/
/*background-position: 215px 8px;*/                /*Position of the background-image*/
}
.wrapper-dropdown-4 a
{
	margin-left:70px;
}
.update_btn
{
	
border:none;
background:#b6bf00;
color:#fff;
text-transform:uppercase;
font-weight:bold;
width:150px;
height:25px;
line-height:25px;
-webkit-border-radius:5px;
-moz-border-radius:5px;
border-radius:5px;
margin-left:50px;
}


.wrapper-dropdown-4 .dropdown li {
    position: relative; /* Enable absolute positioning for checkboxes */
}

.wrapper-dropdown-4 .dropdown li label {
    display: block;
    padding: 5px 0px 5px 10px; /* Same padding as the button */
    border-bottom: 1px dotted #1ccfcf;
    -webkit-transition: all 0.3s ease-out;
    -moz-transition: all 0.3s ease-out;
    -ms-transition: all 0.3s ease-out;
    -o-transition: all 0.3s ease-out;
    transition: all 0.3s ease-out;
}

.wrapper-dropdown-4 .dropdown li:last-of-type label {
    border: none;
}

.wrapper-dropdown-4 .dropdown li input /* Checkboxes */ {
    position: absolute;
    display: block;
    right: 10px;
    top: 50%;
    margin-top: -8px;
}

/* Hover state */

.wrapper-dropdown-4 .dropdown li:hover label {
    background: #f0f0f0;
}

/* Checked state */

.wrapper-dropdown-4 .dropdown li input:checked ~ label {
    color: grey;
    text-decoration: line-through;
}

/* Active state */

.wrapper-dropdown-4.active:after {
    border-width: 0 6px 6px 6px;
}

.wrapper-dropdown-4.active .dropdown {
	display:block;
    opacity: 1;
	filter: alpha(opacity:100);
    pointer-events: auto;
}

/* No CSS3 support */

.no-opacity       wrapper-dropdown-4 .dropdown,
.no-pointerevents .wrapper-dropdown-4 .dropdown {
    display: none;
    opacity: 1; /* If opacity support but no pointer-events support */
    pointer-events: auto; /* If pointer-events support but no pointer-events support */
}

.no-opacity       .wrapper-dropdown-4.active .dropdown,
.no-pointerevents .wrapper-dropdown-4.active .dropdown {
    display: block;
}


