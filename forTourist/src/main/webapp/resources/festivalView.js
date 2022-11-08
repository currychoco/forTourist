const noImage = "https://www.pyeongtaek.go.kr/common/images/etc/ready.jpg";

const CNT = 12;
let page = 1;
let lastPage = 100;

$('.back_button').hide();
$('.next_button').hide();

function searchFestival(){
	  $('.container').empty(); // 지우기
	let date = $("#date").val();
   $.ajax({
       method:"post",
       url:"/forTourist/SearchFestivalViewAction",
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
	    <div class='contained'>
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
				
				$('.contained').append(
				//테이블을 사용하는것보다 ul/ol 태그를 사용하는게 세로로 세우기 더 쉬워요!
				//원래 써놓으신건 따로 백업해놨습니다 필요하시면 슬랙으로 보내드릴게요 
               `<ul class = "content">
					<li class = "imgs"><a href = 'detailFestival?contentId=${contentId}' target='_blank'><img src ="${posterImage}" id = "firstimg"></a></li>
					<li id = "title">${title}</li>
					<li>${eventStartDate}</li>
					<li>${eventEndDate}</li>
					<li>${addr1}</li>
		 		</ul>`
            );
			}

		
		$('.container').append(
			`
			</div>
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
 