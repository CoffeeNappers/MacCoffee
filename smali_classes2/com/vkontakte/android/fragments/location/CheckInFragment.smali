.class public Lcom/vkontakte/android/fragments/location/CheckInFragment;
.super Lcom/vkontakte/android/fragments/VKRecyclerFragment;
.source "CheckInFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/BackListener;
.implements Lcom/vk/attachpicker/SupportExternalToolbarContainer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/location/CheckInFragment$PlaceHolder;,
        Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;,
        Lcom/vkontakte/android/fragments/location/CheckInFragment$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/VKRecyclerFragment",
        "<",
        "Lcom/vkontakte/android/GeoPlace;",
        ">;",
        "Lcom/vkontakte/android/fragments/BackListener;",
        "Lcom/vk/attachpicker/SupportExternalToolbarContainer;"
    }
.end annotation


# static fields
.field static final CHECK_IN_RESULT:I = 0x2099

.field static final CREATE_PLACE_RESULT:I = 0x209a

.field private static final KEY_MAP_SAVED_STATE:Ljava/lang/String; = "mapState"

.field static final LIST_PADDING:I

.field static final MAP_HEIGHT:I


# instance fields
.field final mAdapter:Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;

.field mAddPlace:Lcom/vkontakte/android/GeoPlace;

.field mAddress:Ljava/lang/String;

.field mCurrentLocation:Lcom/vkontakte/android/GeoPlace;

.field mLocation:Landroid/location/Location;

.field mMap:Lcom/google/android/gms/maps/MapView;

.field mMapContainer:Landroid/view/ViewGroup;

.field private mMapInitialized:Z

.field final mNearLocations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/GeoPlace;",
            ">;"
        }
    .end annotation
.end field

.field mQuery:Ljava/lang/String;

.field final mSearchLocations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/GeoPlace;",
            ">;"
        }
    .end annotation
.end field

.field mSearchMode:Z

.field mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 66
    const/high16 v0, 0x41000000    # 8.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->LIST_PADDING:I

    .line 67
    const/high16 v0, 0x43160000    # 150.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->MAP_HEIGHT:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 110
    const v0, 0x7fffffff

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;-><init>(I)V

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mNearLocations:Ljava/util/List;

    .line 96
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchLocations:Ljava/util/List;

    .line 97
    new-instance v0, Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/location/CheckInFragment;Lcom/vkontakte/android/fragments/location/CheckInFragment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mAdapter:Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;

    .line 99
    new-instance v0, Lcom/vkontakte/android/GeoPlace;

    invoke-direct {v0}, Lcom/vkontakte/android/GeoPlace;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mCurrentLocation:Lcom/vkontakte/android/GeoPlace;

    .line 100
    new-instance v0, Lcom/vkontakte/android/GeoPlace;

    invoke-direct {v0}, Lcom/vkontakte/android/GeoPlace;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mAddPlace:Lcom/vkontakte/android/GeoPlace;

    .line 107
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMapInitialized:Z

    .line 111
    const v0, 0x7f03023c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->setLayout(I)V

    .line 112
    const v0, 0x7f03006f

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->setListLayoutId(I)V

    .line 113
    return-void
.end method

.method static synthetic access$102(Lcom/vkontakte/android/fragments/location/CheckInFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/location/CheckInFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/location/CheckInFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/location/CheckInFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/location/CheckInFragment;Ljava/util/List;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/location/CheckInFragment;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Z

    .prologue
    .line 63
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->onDataLoaded(Ljava/util/List;Z)V

    return-void
.end method

.method static synthetic access$402(Lcom/vkontakte/android/fragments/location/CheckInFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/location/CheckInFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/location/CheckInFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/location/CheckInFragment;

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->onScroll()V

    return-void
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/location/CheckInFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/location/CheckInFragment;

    .prologue
    .line 63
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->showMapNotAvailable()V

    return-void
.end method

.method private isInContextOfAttachActivity()Z
    .locals 1

    .prologue
    .line 104
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v0, v0, Lcom/vk/attachpicker/AttachActivity;

    return v0
.end method

.method private onScroll()V
    .locals 5

    .prologue
    .line 319
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-nez v3, :cond_3

    const/4 v0, 0x0

    .line 320
    .local v0, "child":Landroid/view/View;
    :goto_0
    if-eqz v0, :cond_2

    .line 321
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v3

    sget v4, Lcom/vkontakte/android/fragments/location/CheckInFragment;->LIST_PADDING:I

    sub-int v1, v3, v4

    .line 322
    .local v1, "firstChildTop":I
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3, v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v2

    .line 323
    .local v2, "position":I
    if-lez v2, :cond_0

    .line 324
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v3

    mul-int/2addr v3, v2

    sub-int/2addr v1, v3

    .line 327
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMapContainer:Landroid/view/ViewGroup;

    if-eqz v3, :cond_1

    .line 328
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMapContainer:Landroid/view/ViewGroup;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMapContainer:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    move-result v4

    sub-int v4, v1, v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 331
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    if-eqz v3, :cond_2

    .line 332
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v3}, Lcom/google/android/gms/maps/MapView;->invalidate()V

    .line 335
    .end local v1    # "firstChildTop":I
    .end local v2    # "position":I
    :cond_2
    return-void

    .line 319
    .end local v0    # "child":Landroid/view/View;
    :cond_3
    iget-object v3, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    goto :goto_0
.end method

.method private setListPadding()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 315
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    sget v3, Lcom/vkontakte/android/fragments/location/CheckInFragment;->LIST_PADDING:I

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchMode:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    add-int/2addr v0, v3

    sget v3, Lcom/vkontakte/android/fragments/location/CheckInFragment;->LIST_PADDING:I

    invoke-virtual {v2, v1, v0, v1, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 316
    return-void

    .line 315
    :cond_0
    sget v0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->MAP_HEIGHT:I

    goto :goto_0
.end method

.method private showMapNotAvailable()V
    .locals 5

    .prologue
    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 172
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getView()Landroid/view/View;

    move-result-object v1

    const v2, 0x7f100262

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 173
    .local v0, "textViewError":Landroid/widget/TextView;
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 174
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMapContainer:Landroid/view/ViewGroup;

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 175
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v1, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setVisibility(I)V

    .line 176
    const-string/jumbo v1, ""

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->setEmptyText(Ljava/lang/CharSequence;)V

    .line 177
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0, v1, v3}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 178
    return-void
.end method

.method public static start()Lcom/vkontakte/android/navigation/Navigator;
    .locals 1

    .prologue
    .line 86
    new-instance v0, Lcom/vkontakte/android/fragments/location/CheckInFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$Builder;-><init>()V

    return-object v0
.end method


# virtual methods
.method protected canGoBack()Z
    .locals 1

    .prologue
    .line 122
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 123
    const/4 v0, 0x0

    .line 125
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->canGoBack()Z

    move-result v0

    goto :goto_0
.end method

.method protected doLoadData(II)V
    .locals 8
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 243
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    if-nez v0, :cond_1

    .line 244
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMapInitialized:Z

    if-nez v0, :cond_0

    .line 245
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 278
    :cond_0
    :goto_0
    return-void

    .line 250
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->cancelLoading()V

    .line 251
    new-instance v1, Lcom/vkontakte/android/api/places/PlacesSearch;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mQuery:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v6, 0x3

    :goto_1
    iget-object v7, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mQuery:Ljava/lang/String;

    invoke-direct/range {v1 .. v7}, Lcom/vkontakte/android/api/places/PlacesSearch;-><init>(DDILjava/lang/String;)V

    new-instance v0, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;

    invoke-direct {v0, p0, p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$1;-><init>(Lcom/vkontakte/android/fragments/location/CheckInFragment;Landroid/app/Fragment;)V

    .line 252
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/places/PlacesSearch;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 277
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    goto :goto_0

    .line 251
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getAccuracy()F

    move-result v0

    const/high16 v6, 0x42c80000    # 100.0f

    cmpl-float v0, v0, v6

    if-lez v0, :cond_3

    const/4 v6, 0x2

    goto :goto_1

    :cond_3
    const/4 v6, 0x1

    goto :goto_1
.end method

.method protected getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 282
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mAdapter:Lcom/vkontakte/android/fragments/location/CheckInFragment$Adapter;

    return-object v0
.end method

.method public hasNavigationDrawer()Z
    .locals 1

    .prologue
    .line 130
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    const/4 v0, 0x0

    .line 132
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->hasNavigationDrawer()Z

    move-result v0

    goto :goto_0
.end method

.method initList()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 294
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v1, Lcom/vkontakte/android/fragments/location/CheckInFragment$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$2;-><init>(Lcom/vkontakte/android/fragments/location/CheckInFragment;)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 310
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v1, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/high16 v4, 0x3f000000    # 0.5f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    const/high16 v4, 0x26000000

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;III)V

    const/high16 v2, 0x42980000    # 76.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2, v5}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;->setPadding(II)Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    move-result-object v1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 311
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->setListPadding()V

    .line 312
    return-void
.end method

.method initMap(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 381
    const v1, 0x7f100261

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMapContainer:Landroid/view/ViewGroup;

    .line 383
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->isInContextOfAttachActivity()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 384
    new-instance v1, Lcom/vkontakte/android/fragments/location/CheckInFragment$4;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$4;-><init>(Lcom/vkontakte/android/fragments/location/CheckInFragment;)V

    new-array v2, v4, [Ljava/lang/Void;

    .line 419
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/location/CheckInFragment$4;->execPool([Ljava/lang/Object;)Lcom/vkontakte/android/background/AsyncTask;

    .line 488
    :cond_0
    :goto_0
    return-void

    .line 421
    :cond_1
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMapInitialized:Z

    if-eqz v1, :cond_0

    .line 425
    new-instance v2, Lcom/vkontakte/android/fragments/location/CheckInFragment$5;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->isInContextOfAttachActivity()Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Lcom/google/android/gms/maps/GoogleMapOptions;

    invoke-direct {v1}, Lcom/google/android/gms/maps/GoogleMapOptions;-><init>()V

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->liteMode(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v1

    :goto_1
    invoke-direct {v2, p0, v3, v1}, Lcom/vkontakte/android/fragments/location/CheckInFragment$5;-><init>(Lcom/vkontakte/android/fragments/location/CheckInFragment;Landroid/content/Context;Lcom/google/android/gms/maps/GoogleMapOptions;)V

    iput-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    .line 438
    if-eqz p2, :cond_3

    const-string/jumbo v1, "mapState"

    .line 439
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 440
    .local v0, "mapState":Landroid/os/Bundle;
    :goto_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/maps/MapView;->onCreate(Landroid/os/Bundle;)V

    .line 442
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMapContainer:Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    const/4 v3, -0x1

    sget v4, Lcom/vkontakte/android/fragments/location/CheckInFragment;->MAP_HEIGHT:I

    invoke-virtual {v1, v2, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 444
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/location/CheckInFragment;)Lcom/google/android/gms/maps/OnMapReadyCallback;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/MapView;->getMapAsync(Lcom/google/android/gms/maps/OnMapReadyCallback;)V

    goto :goto_0

    .line 425
    .end local v0    # "mapState":Landroid/os/Bundle;
    :cond_2
    new-instance v1, Lcom/google/android/gms/maps/GoogleMapOptions;

    invoke-direct {v1}, Lcom/google/android/gms/maps/GoogleMapOptions;-><init>()V

    invoke-virtual {v1, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->compassEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomControlsEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v1

    goto :goto_1

    .line 439
    :cond_3
    const/4 v0, 0x0

    goto :goto_2
.end method

.method initMockLocations()V
    .locals 2

    .prologue
    .line 286
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mCurrentLocation:Lcom/vkontakte/android/GeoPlace;

    const v1, 0x7f080197

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/GeoPlace;->title:Ljava/lang/String;

    .line 287
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mCurrentLocation:Lcom/vkontakte/android/GeoPlace;

    const/4 v1, -0x1

    iput v1, v0, Lcom/vkontakte/android/GeoPlace;->id:I

    .line 288
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mCurrentLocation:Lcom/vkontakte/android/GeoPlace;

    const v1, 0x7f08033d

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/GeoPlace;->address:Ljava/lang/String;

    .line 289
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mAddPlace:Lcom/vkontakte/android/GeoPlace;

    const v1, 0x7f0800ba

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/GeoPlace;->title:Ljava/lang/String;

    .line 290
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mAddPlace:Lcom/vkontakte/android/GeoPlace;

    const/4 v1, -0x2

    iput v1, v0, Lcom/vkontakte/android/GeoPlace;->id:I

    .line 291
    return-void
.end method

.method initToolbar()V
    .locals 3

    .prologue
    .line 338
    const v0, 0x7f080142

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->setTitle(I)V

    .line 340
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-nez v0, :cond_0

    .line 342
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->isTablet:Z

    if-eqz v0, :cond_1

    const v0, 0x7f0202c5

    :goto_0
    invoke-virtual {v1, v0}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 343
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 345
    :cond_0
    new-instance v0, Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/fragments/location/CheckInFragment$3;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$3;-><init>(Lcom/vkontakte/android/fragments/location/CheckInFragment;)V

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;-><init>(Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    .line 363
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->setHasOptionsMenu(Z)V

    .line 364
    return-void

    .line 342
    :cond_1
    const v0, 0x7f02014f

    goto :goto_0
.end method

.method synthetic lambda$initMap$1(Lcom/google/android/gms/maps/GoogleMap;)V
    .locals 3
    .param p1, "map"    # Lcom/google/android/gms/maps/GoogleMap;

    .prologue
    const/4 v2, 0x0

    .line 445
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_1

    .line 486
    :cond_0
    :goto_0
    return-void

    .line 448
    :cond_1
    if-nez p1, :cond_2

    .line 450
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-nez v0, :cond_0

    .line 451
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0801f9

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 452
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 456
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/google/android/gms/maps/GoogleMap;->setMyLocationEnabled(Z)V

    .line 457
    invoke-virtual {p1}, Lcom/google/android/gms/maps/GoogleMap;->getUiSettings()Lcom/google/android/gms/maps/UiSettings;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/UiSettings;->setMyLocationButtonEnabled(Z)V

    .line 458
    invoke-virtual {p1}, Lcom/google/android/gms/maps/GoogleMap;->getUiSettings()Lcom/google/android/gms/maps/UiSettings;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/UiSettings;->setZoomControlsEnabled(Z)V

    .line 459
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 460
    invoke-virtual {p1}, Lcom/google/android/gms/maps/GoogleMap;->getUiSettings()Lcom/google/android/gms/maps/UiSettings;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/UiSettings;->setMapToolbarEnabled(Z)V

    .line 462
    :cond_3
    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/location/CheckInFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/location/CheckInFragment;Lcom/google/android/gms/maps/GoogleMap;)Lcom/google/android/gms/maps/GoogleMap$OnMyLocationChangeListener;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/maps/GoogleMap;->setOnMyLocationChangeListener(Lcom/google/android/gms/maps/GoogleMap$OnMyLocationChangeListener;)V

    goto :goto_0
.end method

.method synthetic lambda$null$0(Lcom/google/android/gms/maps/GoogleMap;Landroid/location/Location;)V
    .locals 9
    .param p1, "map"    # Lcom/google/android/gms/maps/GoogleMap;
    .param p2, "loc"    # Landroid/location/Location;

    .prologue
    const/high16 v8, 0x42c80000    # 100.0f

    .line 463
    new-instance v2, Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    invoke-direct {v2}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;-><init>()V

    new-instance v3, Lcom/google/android/gms/maps/model/LatLng;

    .line 464
    invoke-virtual {p2}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    invoke-virtual {p2}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    invoke-virtual {v2, v3}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->target(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    move-result-object v2

    const/high16 v3, 0x41800000    # 16.0f

    .line 465
    invoke-virtual {v2, v3}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->zoom(F)Lcom/google/android/gms/maps/model/CameraPosition$Builder;

    move-result-object v2

    .line 466
    invoke-virtual {v2}, Lcom/google/android/gms/maps/model/CameraPosition$Builder;->build()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v0

    .line 467
    .local v0, "cameraPosition":Lcom/google/android/gms/maps/model/CameraPosition;
    invoke-static {v0}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newCameraPosition(Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/google/android/gms/maps/GoogleMap;->moveCamera(Lcom/google/android/gms/maps/CameraUpdate;)V

    .line 469
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    if-eqz v2, :cond_1

    .line 470
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    invoke-virtual {v2, p2}, Landroid/location/Location;->distanceTo(Landroid/location/Location;)F

    move-result v1

    .line 471
    .local v1, "distance":F
    const/high16 v2, 0x41a00000    # 20.0f

    cmpl-float v2, v1, v2

    if-gtz v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    invoke-virtual {v2}, Landroid/location/Location;->getAccuracy()F

    move-result v2

    cmpl-float v2, v2, v8

    if-lez v2, :cond_1

    invoke-virtual {p2}, Landroid/location/Location;->getAccuracy()F

    move-result v2

    cmpg-float v2, v2, v8

    if-gez v2, :cond_1

    .line 472
    :cond_0
    iput-object p2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    .line 473
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 474
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->loadData()V

    .line 475
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->loadPlace()V

    .line 480
    .end local v1    # "distance":F
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    if-nez v2, :cond_2

    .line 481
    iput-object p2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mLocation:Landroid/location/Location;

    .line 482
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->loadData()V

    .line 483
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->loadPlace()V

    .line 485
    :cond_2
    return-void
.end method

.method loadPlace()V
    .locals 4

    .prologue
    .line 491
    new-instance v0, Lcom/vkontakte/android/fragments/location/CheckInFragment$6;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment$6;-><init>(Lcom/vkontakte/android/fragments/location/CheckInFragment;)V

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/content/Context;

    const/4 v2, 0x0

    .line 527
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/location/CheckInFragment$6;->execPool([Ljava/lang/Object;)Lcom/vkontakte/android/background/AsyncTask;

    .line 528
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v1, -0x1

    .line 220
    if-ne p2, v1, :cond_0

    const/16 v0, 0x2099

    if-ne p1, v0, :cond_0

    .line 221
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, v1, p3}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 222
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 224
    :cond_0
    if-ne p2, v1, :cond_1

    const/16 v0, 0x209a

    if-ne p1, v0, :cond_1

    .line 225
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, v1, p3}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 226
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 228
    :cond_1
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 137
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onAttach(Landroid/app/Activity;)V

    .line 139
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-nez v0, :cond_0

    .line 140
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMapInitialized:Z

    .line 141
    invoke-static {p1, v2}, Lcom/vkontakte/android/ActivityUtils;->requireGoogleMaps(Landroid/app/Activity;Z)Z

    move-result v0

    if-nez v0, :cond_1

    .line 142
    const v0, 0x7f0801f9

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 143
    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    .line 149
    :cond_0
    :goto_0
    return-void

    .line 145
    :cond_1
    invoke-static {p1}, Lcom/google/android/gms/maps/MapsInitializer;->initialize(Landroid/content/Context;)I

    .line 146
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMapInitialized:Z

    goto :goto_0
.end method

.method public onBackPressed()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 232
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    if-eqz v1, :cond_0

    .line 233
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->isExpanded()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 234
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setExpanded(Z)V

    .line 235
    const/4 v0, 0x1

    .line 238
    :cond_0
    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 153
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 154
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->setRefreshEnabled(Z)V

    .line 155
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 182
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 183
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->onCreateOptionsMenu(Landroid/view/Menu;)V

    .line 184
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 204
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onDestroy()V

    .line 205
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->cancelLoading()V

    .line 206
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 188
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onPause()V

    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    if-eqz v0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView;->onPause()V

    .line 192
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 196
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onResume()V

    .line 197
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    if-eqz v0, :cond_0

    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/MapView;->onResume()V

    .line 200
    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 210
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 211
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    if-eqz v1, :cond_0

    .line 212
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 213
    .local v0, "mapState":Landroid/os/Bundle;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMap:Lcom/google/android/gms/maps/MapView;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/maps/MapView;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 214
    const-string/jumbo v1, "mapState"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 216
    .end local v0    # "mapState":Landroid/os/Bundle;
    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 159
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 160
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->initToolbar()V

    .line 161
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->initMap(Landroid/view/View;Landroid/os/Bundle;)V

    .line 162
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->initList()V

    .line 163
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->initMockLocations()V

    .line 165
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 166
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 167
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 169
    :cond_0
    return-void
.end method

.method public provideToolbar(Landroid/content/Context;)Landroid/view/ViewGroup;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    return-object v0
.end method

.method setSearchMode(Z)V
    .locals 3
    .param p1, "searchMode"    # Z

    .prologue
    const/4 v1, 0x0

    .line 367
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchMode:Z

    if-eq v0, p1, :cond_0

    .line 368
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchMode:Z

    .line 369
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMapContainer:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 370
    iget-object v2, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mMapContainer:Landroid/view/ViewGroup;

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchMode:Z

    if-eqz v0, :cond_1

    const/16 v0, 0x8

    :goto_0
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 371
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->setListPadding()V

    .line 372
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->mSearchMode:Z

    if-nez v0, :cond_0

    .line 373
    iget-object v0, p0, Lcom/vkontakte/android/fragments/location/CheckInFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->smoothScrollToPosition(I)V

    .line 377
    :cond_0
    return-void

    :cond_1
    move v0, v1

    .line 370
    goto :goto_0
.end method
