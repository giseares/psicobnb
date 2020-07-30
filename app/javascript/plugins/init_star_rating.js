// app/javascript/plugins/init_star_rating.js
import "jquery-bar-rating";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {
  $('#review_rating_sharp').barrating({
    theme: 'css-stars'
  });
  $('#review_rating_qualityprice').barrating({
    theme: 'css-stars'
  });
  $('#review_rating_facilities').barrating({
    theme: 'css-stars'
  });
 };

export { initStarRating };
