class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all
    if params[:search]
      @entries = Entry.search(params[:search]).order("Name ASC")
    else
      @entries = Entry.all.order('Name ASC')
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)
    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    counter = PhoneContact.where(:entry_id => @entry.id).count
    if counter > 0
      flash[:notice] = 'Delete all associated Phone Numbers before deleting an Entry.'
      redirect_to @entry
    else
      @entry.destroy
      respond_to do |format|
        format.html { redirect_to entries_url, notice: 'Entry was successfully deleted.' }
        format.json { head :no_content }
      end
  end
  end

  #SEARCH
  def search
       @result = Entry.search params[:Name]
       respond_with @result
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:Name, phone_contacts_attributes: [:id, :Label, :Number, :entry_id, :_destroy])
    end
end
