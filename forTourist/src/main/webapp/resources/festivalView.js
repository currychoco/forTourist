const noImage = "https://www.pyeongtaek.go.kr/common/images/etc/ready.jpg";

const CNT = 6;
let page = 1;
let lastPage = 100;

$('.back_button').hide();
$('.next_button').hide();

function searchFestival(){
	  $('.container').empty(); // 지우기
	let date = $("#date").val();
   $.ajax({
       method:"post",
       url:"/forTourist/searchFestivalViewPro.jsp",
       data:{
        	date : date
       }
   }).done(function(response){
		const list = response;
		console.log(list);
		lastPage = parseInt(list.length / CNT);
		if(list.length/CNT > lastPage){
			lastPage++;
		}
		
		 $('.container').append(
                `
                <table>
                `
            );
            for(let i = (page-1)*CNT; i<(page-1)*CNT + CNT; i++){
				if(i == list.length){
					break;
				}
				const contentId = list[i].contentId;
				const addr1 = list[i].addr1;
				const eventEndDate = list[i].eventEndDate;
				const eventStartDate = list[i].eventStartDate;
				let posterImage = list[i].posterImage;
				if(posterImage === ""){
					posterImage = noImage;
				}
				const title = list[i].title;
				
				$('.container').append(
				
                `<tr>
               		<td><a href = 'detailFestival?contentId=${contentId}'><img src ="${posterImage}" width="160px" height="auto"></a></td>
               		<td>${title}</td>
               		<td>${eventStartDate}</td>
               		<td>${eventEndDate}</td>
               		<td>${addr1}</td>
                </tr>`
            );
			}

		
		$('.container').append(
                `
                </table>
                `
        );
        $('.back_button').hide();
        $('.next_button').hide();

        if(page !== lastPage){
            $('.next_button').show();
        }
        if(page!==1){
            $('.back_button').show();
        }
   });
}

function firstSearchFestival(){
	page = 1;
	searchFestival();
}

function getDataBack(){
    if(page > 1){
        page--;
        searchFestival();
    }
}

function getDataNext(){
    if(page!==lastPage){
        page++;
        searchFestival();
        $('.back_button').show();
    }
   
}
 