# coding: utf-8
require 'spec_helper'

describe Admin::ContentController do

#  render_views

  before do
    Factory(:blog)
  end

  describe 'merge article when admin' do
    it 'should call the model method to perform the merge' do
      @user = Factory(:user, :profile => Factory(:profile_admin, :label => Profile::ADMIN))
      request.session = { :user => @user.id }

      content1 = 'content 1'
      article_dest = mock_model(Article, :title => 'article 1', :body => content1, :id => 1)
      article_dest.should_receive(:merge_with).and_return(true)
      Article.stub!(:find_by_id).and_return(article_dest)
      post 'merge', { :id => 1, :merge_with => 2 }
      response.should redirect_to :action => 'edit', :id => 1
    end

    it 'should deny merging if non-admin user' do
      @user = Factory(:user, :text_filter => Factory(:markdown), :profile => Factory(:profile_publisher))
      request.session = { :user => @user.id }

      content1 = 'content 1'
      article_dest = mock_model(Article, :title => 'article 1', :body => content1, :id => 1)
      article_dest.should_not_receive(:merge_with)
      Article.stub!(:find_by_id).and_return(article_dest)
      post 'merge', { :id => 1, :merge_with => 2 }
      response.should render_template('index')
      response.should have_content('Error, you are not allowed to perform this action')
#      response.should render_template('index')
    end

  end
end
