module CategoriesHelper
  
  def show_path_image(article, i)
    order_index = i <= 2? -1 : 2;

    content_tag( :div, nil, class: ["column", "is-6", "p-0", "news-image"], style: "
      background: url('#{ rails_blob_url(article.image) }');
      background-repeat: no-repeat;
      background-position: center;
      background-size: cover;
      background-blend-mode: color-burn;
      min-height: 300px;
      order: #{order_index}"
    )
  end

end
