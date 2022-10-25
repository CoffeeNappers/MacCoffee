.class Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "CheckInFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/location/CheckInFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Adapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/location/CheckInFragment;)V
    .locals 0

    .prologue
    .line 530
    iput-object p1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/location/CheckInFragment;Lcom/vkontakte/android/fragments/location/CheckInFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/location/CheckInFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/location/CheckInFragment$1;

    .prologue
    .line 530
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/location/CheckInFragment;)V

    return-void
.end method


# virtual methods
.method get(I)Lcom/vkontakte/android/GeoPlace;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 533
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchMode:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchLocations:Ljava/util/List;

    :goto_0
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/GeoPlace;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mNearLocations:Ljava/util/List;

    goto :goto_0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 548
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchMode:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchLocations:Ljava/util/List;

    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mNearLocations:Ljava/util/List;

    goto :goto_0
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 543
    check-cast p1, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;

    .end local p1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;->get(I)Lcom/vkontakte/android/GeoPlace;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;->bind(Ljava/lang/Object;)V

    .line 544
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 538
    new-instance v0, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/location/CheckInFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;-><init>(Lcom/vkontakte/android/fragments/location/CheckInFragment;Landroid/view/ViewGroup;)V

    return-object v0
.end method
