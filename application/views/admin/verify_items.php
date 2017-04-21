<html>
    <style>
    .center {
        margin: auto;
        width: 60%;
        padding: 50px;
        
    }
</style>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/datepicker.css" rel="stylesheet" />
<div class="container">
    <div class="form-group">
    <div class="input-group date" id="datetimepicker1">
        <input type="text" class="form-control" /><span class="input-group-addon"><span class="glyphicon-calendar glyphicon"></span></span>
         </div>
</div>

$('#datetimepicker1 input').click(function(event){
   $('#datetimepicker1 ').data("DateTimePicker").show();
});
</div>
</html>

