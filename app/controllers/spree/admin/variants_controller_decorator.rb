Spree::Admin::VariantsController.class_eval do

  def create_all
    @product = Spree::Product.find_by(slug: params[:product_id])
    options = []

    @product.option_types.order(:position).each do |o|
      options << o.option_values.collect(&:id)
    end

    options = SolidusVariantAllOptions::ArrayHelper.array_permutation options

    options.each do |ids|
      v = @product.variants.new
      sku = @product.sku
      if ids.kind_of?(Array)
        v.option_value_ids = ids.flatten
      else
        v.option_value_ids = ids
      end
      v.option_value_ids.each do |ovid|
        ov=Spree::OptionValue.find(ovid)
        sku="#{sku} #{ov.presentation[0...3].upcase}"
      end
      pr=Spree::Variant.find_by(sku: sku)
      if (!pr) then v.sku=sku end
      v.price = @product.price
      v.weight = @product.weight
      v.height = @product.height
      v.width = @product.width
      v.depth = @product.depth
      v.save
    end

    redirect_to admin_product_variants_url(@product)
  end


  def remove_all
    @product = Spree::Product.find_by(slug: params[:product_id])
    all_variants_excluding_master = @product.variants
    all_variants_excluding_master.destroy_all
    redirect_to admin_product_variants_url(@product)
  end

end
