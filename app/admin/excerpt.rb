#!/bin/env ruby
# encoding: utf-8

ActiveAdmin.register Excerpt do

  menu priority: 4, label: '书摘'

  controller do
    def permitted_params
      params.permit excerpt: [:name, :body, :author_id, :book_id, :quote]
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :body
    column :quote
    column :author_id
    column :book_id
    column :created_at
    column :updated_at
    default_actions
  end

end
