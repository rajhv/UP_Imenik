var initialize = function(){
  // #mem is the id of the 'member' select box
  // on the welcome page
  // on change fetch the department list for the member
  // and fill the select box
  $("#mem").change(function () {
    var selectedMemberOption = $(this).find(":selected"); // find the selected option
    var selectedMemberId = selectedMemberOption.val(); // get value
    var selectedMemberLabel = selectedMemberOption.text(); // get displayed text

    var departmentsSelect = $("#dep"); // department select box
    clearSelectBox(departmentsSelect); // clear the department select box except the placeholder

    // a member is selected
    if (selectedMemberId){
      console.log("loading departments for member " + selectedMemberLabel);
      var url = "/departments";

      // load departments via AJAX
      // http://api.jquery.com/jquery.ajax/
      $.ajax({
        url: url,
        data: { "mem": selectedMemberId },
        dataType: "json",
        method: "GET"
      }).done( function(departments) {
        // create options from recieved data(JSON)
        console.log("got the following departments -> " + JSON.stringify(departments));
        // iterate through all recieved objects and create department options
        // enable departments select box when done
        $.each(departments, function(index, department) {
          departmentsSelect.append(
            $("<option />").text(department.name).val(department.id)
          );

          if (index == departments.length-1){
            console.log("last department added to list. enabling select box");
            departmentsSelect.attr('disabled', false);
          }
        }); // end each loop

        // load employees for selected member
        triggerSearch(selectedMemberId, undefined, undefined);
      }); // end ajax function
      //clear query for employees
      $('#query').val("");
    } else {
      // an empty option was selected('Vse članice')
      console.log("no member selected. Show all employees");
      // load all employees
      triggerSearch(undefined, undefined, undefined);
      // clear the department select box except the placeholder
      clearSelectBox(departmentsSelect);
      //disable departments select box
      departmentsSelect.attr('disabled', true);
      //clear query for employees
      $('#query').val("");
    }
  });

  // when the selected department changes
  // we should load employees only for that department
  $("#dep").change(function () {
    var selectedDepartmentOption = $(this).find(":selected");
    var selectedDepartmentId = selectedDepartmentOption.val(); // get value
    var selectedDepartmentLabel = selectedDepartmentOption.text();

    var selectedMemberOption = $("#mem").find(":selected");
    var selectedMemberId = selectedMemberOption.val();
    var selectedMemberLabel = selectedMemberOption.text();

    console.log("member: " + selectedMemberId + "  department:" + selectedDepartmentId);
    if (selectedDepartmentId){
      triggerSearch(selectedMemberId, selectedDepartmentId, undefined);
    }
    else{
      triggerSearch(selectedMemberId, undefined, undefined);
    }
    //clear query for employees
    $('#query').val("");
  }); // end #dep change
}

// clear all options(except placeholder) from provided selectBoxElement
function clearSelectBox(selectBoxElement) {
  var element = $(selectBoxElement);
  element.find("option").each(function () {
    if($(this).val() !== ""){
      $(this).remove(); // remove option from select if it has a value(it's not a placeholder)
    }
  });
}

// trigger search with parameters
function triggerSearch(memberId, departmentId, searchString){
  var searchUrl = "search";
  var queryParams = { "mem": memberId, "dep": departmentId, "query": searchString };

  // jquery ajax get shorthand
    // https://api.jquery.com/jquery.get/
  // dataType 'script' loads view with .js.erb
  $.get(
    searchUrl,
    queryParams,
    'script'
  );
}

//initialize the script on page:load which occurs after rails turbolinks link_to
//$(document).ready(initialize);
//initialize the script on page:load which occurs after rails turbolinks link_to
$(document).on('turbolinks:load', initialize);
