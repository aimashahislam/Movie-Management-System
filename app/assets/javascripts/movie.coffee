jQuery ->
  $(document).on "turbolinks:load", ->
    chosen_initializer();
    star_show();
    star_input();

  chosen_initializer = () ->
    $('.movie-actor-ids').chosen();

  @star_show = ()->
    $('.star-rating').raty({
      path: '/assets/',
      readOnly: true,
      score: () ->
        return $(this).attr('data-score');
    });

  @star_input = ()->
    $('#star-rating').raty({
      path: '/assets/',
      scoreName: 'review[rating]'
    });
