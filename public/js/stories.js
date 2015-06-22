var stories;
var lastCol;
$.get("/stories/json", function(data) { stories = data; listBy('priority'); });

function listBy(col, primer)
{
  if(col == lastCol)
  {
    reverse = false;
    lastCol = false;
  }
  else
  {
    reverse = true;
    lastCol = col;
  }

  sorted = stories
  sorted.sort(sort_by(col, reverse, primer))
  $(".story-row").remove();

  for (var i = 0; i < sorted.length; i++)
  {
    (sorted[i].priority) ? priority = sorted[i].priority : priority = "";

    if (sorted[i].assignee)
    {
      assigneeName = sorted[i].assignee.name;
      assigneeID = sorted[i].assignee.id;
    }
    else
    {
      assigneeName = "";
      assigneeID = "";
    }
    $("#story-table").append('<div class="row story-row">'+
        '<div class="col-sm-1"><a href="/stories/'+ sorted[i].id +'/edit">'+ sorted[i].id +'</a></div>' +
        '<div class="col-sm-6"><a href="/stories/'+ sorted[i].id +'/edit">'+ sorted[i].role +' should be able to '+ sorted[i].goal +'</a></div>' +
        '<div class="col-sm-2"><a href="/users/'+ sorted[i].user.id +'">'+ sorted[i].user.name +'</a></div>' +
        '<div class="col-sm-2"><a href="/users/'+ assigneeID +'">'+ assigneeName +'</a></div>' +
        '<div class="col-sm-1"><a href="/stories/'+ sorted[i].id +'/edit">  '+ priority +'</a></div>' +
        '</div>'
    );
  }
}

var sort_by = function(field, reverse, primer){

   var key = primer ? 
       function(x) {return primer(x[field])} : 
       function(x) {return x[field]};

   reverse = !reverse ? 1 : -1;

   return function (a, b) {
       return a = key(a), b = key(b), reverse * ((a > b) - (b > a));
     } 
}

$('.icon').on('click', function() {
  if ($(this).hasClass('fui-triangle-right-large'))
  {
    $('.icon').attr("class", "fui-triangle-right-large icon")
    $(this).removeClass('fui-triangle-right-large').addClass('fui-triangle-up');
  }
  else if ($(this).hasClass('fui-triangle-up'))
  {
    $(this).removeClass('fui-triangle-up').addClass('fui-triangle-down');
  }
  else if ($(this).hasClass('fui-triangle-down'))
  {
    $(this).removeClass('fui-triangle-down').addClass('fui-triangle-up'); 
  }
})
