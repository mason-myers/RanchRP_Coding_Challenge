$(function(){
    // Initially hide all ui elements from resource
    $('.notify__text').hide();
    $('.menu__wrapper').hide();
    $('.cantChangePed').hide();

    // when message is recieved
    window.addEventListener('message', (event) => {
        if (event.data.type === 'open') { // when sending 'open' message from resource through NUI
            // fade elements
            $('.menu__wrapper').fadeIn(500);
            $('.notify__text').fadeOut(500);
        }
        else if (event.data.type === 'prompt') { // when sending 'prompt' message from resource through NUI
            // fade elements
            $('.notify__text').fadeIn(500);
        }
        else if (event.data.type === 'close') { // when sending 'close' message from resource through NUI
            // fade elements
            $('.notify__text').fadeOut(500);
            $('.menu__wrapper').fadeOut(500);
            $('.cantChangePed').fadeOut(500);
        }
        else if (event.data.type === 'cannotChangePed') { // when sending 'cannotChangePed' message from resource through NUI
            // fade elements
            $('.notify__text').fadeOut(500);
            $('.menu__wrapper').fadeOut(500);
            $('.cantChangePed').fadeIn(500);
        }
    });

    // when users click on each button element (this could very well be made dynamic with a list of peds and buttons, but this was easier to impliment in a short period of time.)
    $(document).on('click', '.selection1', function(){
        fetch(`https://${GetParentResourceName()}/selection1`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                data: ''
            })
        }).then(resp => resp.json()).then(resp => console.log(resp));
    });

    $(document).on('click', '.selection2', function(){
        fetch(`https://${GetParentResourceName()}/selection2`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                data: ''
            })
        }).then(resp => resp.json()).then(resp => console.log(resp));
    });

    $(document).on('click', '.selection3', function(){
        fetch(`https://${GetParentResourceName()}/selection3`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                data: ''
            })
        }).then(resp => resp.json()).then(resp => console.log(resp));
    });

    $(document).on('click', '.selection4', function(){
        fetch(`https://${GetParentResourceName()}/selection4`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify({
                data: ''
            })
        }).then(resp => resp.json()).then(resp => console.log(resp));
    });
});