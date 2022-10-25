.class public Lcom/vk/attachpicker/fragment/GalleryFragment;
.super Landroid/app/Fragment;
.source "GalleryFragment.java"

# interfaces
.implements Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;
.implements Lcom/vk/attachpicker/SupportExternalToolbarContainer;


# static fields
.field private static final GALLERY_PHOTO_INTENT:I = 0x2

.field private static final GALLERY_VIDEO_INTENT:I = 0x3


# instance fields
.field private adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

.field private bigPreviews:Z

.field private cameraEnabled:Z

.field private gridLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

.field private imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

.field private mediaType:I

.field private onlyLastNMilliseconds:J

.field private preventStyling:Z

.field private preventStylingPhoto:Z

.field private preventStylingVideo:Z

.field private progressView:Lcom/vk/attachpicker/widget/ContextProgressView;

.field private recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

.field private final selectionUpdateListener:Lcom/vk/attachpicker/events/NotificationListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/attachpicker/events/NotificationListener",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private singleMode:Z

.field private spinner:Lcom/vk/attachpicker/widget/CustomSpinner;

.field private spinnerAdapter:Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;

.field private staticHeaderTitle:Ljava/lang/String;

.field private staticTitle:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

.field private thumb:Z

.field private toolbarContainer:Landroid/widget/FrameLayout;

.field private videoMaxLengthMs:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 55
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 60
    iput-boolean v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->preventStyling:Z

    .line 61
    iput-boolean v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->preventStylingPhoto:Z

    .line 62
    iput-boolean v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->preventStylingVideo:Z

    .line 63
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->videoMaxLengthMs:J

    .line 68
    iput-boolean v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->singleMode:Z

    .line 69
    const/16 v0, 0xde

    iput v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->mediaType:I

    .line 70
    iput-boolean v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->thumb:Z

    .line 496
    invoke-static {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/attachpicker/events/NotificationListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->selectionUpdateListener:Lcom/vk/attachpicker/events/NotificationListener;

    return-void
.end method

.method static synthetic access$000(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/attachpicker/widget/ContextProgressView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/fragment/GalleryFragment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->progressView:Lcom/vk/attachpicker/widget/ContextProgressView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/attachpicker/widget/GalleryRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/fragment/GalleryFragment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vk/attachpicker/fragment/GalleryFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/fragment/GalleryFragment;

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->thumb:Z

    return v0
.end method

.method static synthetic access$200(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/fragment/GalleryFragment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->spinnerAdapter:Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/attachpicker/widget/CustomSpinner;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/fragment/GalleryFragment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->spinner:Lcom/vk/attachpicker/widget/CustomSpinner;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/fragment/GalleryFragment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vk/attachpicker/fragment/GalleryFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/fragment/GalleryFragment;

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->preventStyling:Z

    return v0
.end method

.method static synthetic access$600(Lcom/vk/attachpicker/fragment/GalleryFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/fragment/GalleryFragment;

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->preventStylingPhoto:Z

    return v0
.end method

.method static synthetic access$700(Lcom/vk/attachpicker/fragment/GalleryFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/fragment/GalleryFragment;

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->preventStylingVideo:Z

    return v0
.end method

.method static synthetic access$800(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/core/simplescreen/WindowScreenContainer;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/fragment/GalleryFragment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    return-object v0
.end method

.method static synthetic access$802(Lcom/vk/attachpicker/fragment/GalleryFragment;Lcom/vk/core/simplescreen/WindowScreenContainer;)Lcom/vk/core/simplescreen/WindowScreenContainer;
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/fragment/GalleryFragment;
    .param p1, "x1"    # Lcom/vk/core/simplescreen/WindowScreenContainer;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    return-object p1
.end method

.method static synthetic access$900(Lcom/vk/attachpicker/fragment/GalleryFragment;)J
    .locals 2
    .param p0, "x0"    # Lcom/vk/attachpicker/fragment/GalleryFragment;

    .prologue
    .line 55
    iget-wide v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->videoMaxLengthMs:J

    return-wide v0
.end method

.method private dispatchTakePictureIntent()V
    .locals 4

    .prologue
    .line 479
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 480
    .local v1, "takePictureIntent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 481
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/vk/attachpicker/util/CameraUtils;->getCameraRequestData(Z)Landroid/support/v4/util/Pair;

    move-result-object v0

    .line 482
    .local v0, "request":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Ljava/lang/Integer;Ljava/io/File;>;"
    const-string/jumbo v3, "output"

    iget-object v2, v0, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/io/File;

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 483
    iget-object v2, v0, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/vk/attachpicker/fragment/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 485
    .end local v0    # "request":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Ljava/lang/Integer;Ljava/io/File;>;"
    :cond_0
    return-void
.end method

.method private dispatchTakeVideoIntent()V
    .locals 4

    .prologue
    .line 488
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.media.action.VIDEO_CAPTURE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 489
    .local v1, "takePictureIntent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 490
    const/4 v2, 0x1

    invoke-static {v2}, Lcom/vk/attachpicker/util/CameraUtils;->getCameraRequestData(Z)Landroid/support/v4/util/Pair;

    move-result-object v0

    .line 491
    .local v0, "request":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Ljava/lang/Integer;Ljava/io/File;>;"
    const-string/jumbo v3, "output"

    iget-object v2, v0, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/io/File;

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 492
    iget-object v2, v0, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/vk/attachpicker/fragment/GalleryFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 494
    .end local v0    # "request":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Ljava/lang/Integer;Ljava/io/File;>;"
    :cond_0
    return-void
.end method

.method private getSelectionContext()Lcom/vk/attachpicker/SelectionContext;
    .locals 2

    .prologue
    .line 203
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    instance-of v1, v1, Lcom/vk/attachpicker/SelectionContext$SelectionContextProvider;

    if-eqz v1, :cond_0

    .line 204
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/SelectionContext$SelectionContextProvider;

    invoke-interface {v1}, Lcom/vk/attachpicker/SelectionContext$SelectionContextProvider;->getSelectionContext()Lcom/vk/attachpicker/SelectionContext;

    move-result-object v0

    .line 208
    .local v0, "selectionContext":Lcom/vk/attachpicker/SelectionContext;
    :goto_0
    return-object v0

    .line 206
    .end local v0    # "selectionContext":Lcom/vk/attachpicker/SelectionContext;
    :cond_0
    const/4 v0, 0x0

    .restart local v0    # "selectionContext":Lcom/vk/attachpicker/SelectionContext;
    goto :goto_0
.end method

.method private initSpinner(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 212
    .local p1, "albums":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 213
    .local v0, "a":Landroid/app/Activity;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->spinner:Lcom/vk/attachpicker/widget/CustomSpinner;

    if-nez v1, :cond_1

    .line 265
    :cond_0
    :goto_0
    return-void

    .line 217
    :cond_1
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-virtual {v1}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->getItemCount()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    .line 221
    new-instance v1, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;

    iget v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->mediaType:I

    invoke-direct {v1, v0, p1, v2}, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I)V

    iput-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->spinnerAdapter:Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;

    .line 222
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->spinnerAdapter:Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;

    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->spinner:Lcom/vk/attachpicker/widget/CustomSpinner;

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;->setSpinner(Lcom/vk/attachpicker/widget/CustomSpinner;)V

    .line 223
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->spinner:Lcom/vk/attachpicker/widget/CustomSpinner;

    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->spinnerAdapter:Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/CustomSpinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 224
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->spinner:Lcom/vk/attachpicker/widget/CustomSpinner;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/CustomSpinner;->setVisibility(I)V

    .line 225
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->spinner:Lcom/vk/attachpicker/widget/CustomSpinner;

    new-instance v2, Lcom/vk/attachpicker/fragment/GalleryFragment$2;

    invoke-direct {v2, p0}, Lcom/vk/attachpicker/fragment/GalleryFragment$2;-><init>(Lcom/vk/attachpicker/fragment/GalleryFragment;)V

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/CustomSpinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    goto :goto_0
.end method

.method private loadMediastore()V
    .locals 4

    .prologue
    .line 268
    iget v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->mediaType:I

    iget-wide v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->onlyLastNMilliseconds:J

    invoke-static {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment$$Lambda$5;->lambdaFactory$(Lcom/vk/attachpicker/fragment/GalleryFragment;)Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;

    move-result-object v1

    invoke-static {v0, v2, v3, v1}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->load(IJLcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;)V

    .line 282
    return-void
.end method


# virtual methods
.method public getPlaceForPhoto(I)Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;
    .locals 8
    .param p1, "index"    # I

    .prologue
    const/4 v2, 0x0

    .line 317
    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->gridLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v5}, Landroid/support/v7/widget/GridLayoutManager;->findFirstVisibleItemPosition()I

    move-result v5

    iget-object v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-virtual {v6}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->delta()I

    move-result v6

    sub-int v0, v5, v6

    .line 318
    .local v0, "firstPosition":I
    sub-int v4, p1, v0

    .line 319
    .local v4, "wantedChild":I
    if-ltz v4, :cond_0

    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    invoke-virtual {v5}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getChildCount()I

    move-result v5

    if-lt v4, v5, :cond_2

    .line 320
    :cond_0
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string/jumbo v7, "GalleryFragment"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string/jumbo v7, "Unable to getTexture imageView for desired position, because it\'s not being displayed on screen."

    aput-object v7, v5, v6

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 337
    :cond_1
    :goto_0
    return-object v2

    .line 323
    :cond_2
    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    invoke-virtual {v5, v4}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .local v3, "view":Landroid/view/View;
    move-object v1, v3

    .line 324
    check-cast v1, Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;

    .line 325
    .local v1, "imageView":Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;
    if-eqz v1, :cond_1

    .line 326
    new-instance v2, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    invoke-direct {v2}, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;-><init>()V

    .line 327
    .local v2, "object":Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;
    iput-object v1, v2, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->imageView:Lcom/vk/attachpicker/widget/LocalImageView;

    .line 328
    iput-object v3, v2, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->containerView:Landroid/view/View;

    .line 329
    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    iput-object v5, v2, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->parentView:Landroid/view/View;

    .line 330
    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;->getStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v5

    iput-object v5, v2, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 331
    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;->hasImage()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 332
    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;->getImageWidth()I

    move-result v5

    iput v5, v2, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->thumbImageWidth:I

    .line 333
    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/MediaStoreItemSmallView;->getImageHeight()I

    move-result v5

    iput v5, v2, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->thumbImageHeight:I

    goto :goto_0
.end method

.method synthetic lambda$loadMediastore$3(Ljava/util/ArrayList;)V
    .locals 3
    .param p1, "mediaStore"    # Ljava/util/ArrayList;

    .prologue
    const/4 v2, 0x0

    .line 269
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 270
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->progressView:Lcom/vk/attachpicker/widget/ContextProgressView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/ContextProgressView;->setVisibility(I)V

    .line 271
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->setVisibility(I)V

    .line 272
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 273
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->setEmptyEnabled(Z)V

    .line 274
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getBucketImages()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->setImages(Ljava/util/ArrayList;)V

    .line 279
    :goto_0
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/fragment/GalleryFragment;->initSpinner(Ljava/util/ArrayList;)V

    .line 281
    :cond_0
    return-void

    .line 276
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->setEmptyEnabled(Z)V

    .line 277
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->setImages(Ljava/util/ArrayList;)V

    goto :goto_0
.end method

.method synthetic lambda$new$5(IILjava/lang/Void;)V
    .locals 1
    .param p1, "eventType"    # I
    .param p2, "eventId"    # I
    .param p3, "eventArgs"    # Ljava/lang/Void;

    .prologue
    .line 497
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    if-eqz v0, :cond_0

    .line 498
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-virtual {v0}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->notifyDataSetChanged()V

    .line 500
    :cond_0
    return-void
.end method

.method synthetic lambda$onActivityResult$4(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 0
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 378
    invoke-direct {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->loadMediastore()V

    return-void
.end method

.method synthetic lambda$onViewCreated$0(Lcom/vk/attachpicker/SelectionContext;I)V
    .locals 13
    .param p1, "selectionContext"    # Lcom/vk/attachpicker/SelectionContext;
    .param p2, "position"    # I

    .prologue
    .line 150
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v12

    .line 152
    .local v12, "a":Landroid/app/Activity;
    if-eqz v12, :cond_1

    :try_start_0
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-virtual {v2}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->delta()I

    move-result v2

    sub-int v2, p2, v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->getItem(I)Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->isCorrupted()Z

    move-result v1

    if-nez v1, :cond_1

    .line 153
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    if-nez v1, :cond_0

    .line 154
    new-instance v1, Lcom/vk/core/simplescreen/WindowScreenContainer;

    invoke-direct {v1, v12}, Lcom/vk/core/simplescreen/WindowScreenContainer;-><init>(Landroid/app/Activity;)V

    iput-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    .line 156
    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    invoke-virtual {v1}, Lcom/vk/core/simplescreen/WindowScreenContainer;->isShowing()Z

    move-result v1

    if-nez v1, :cond_1

    .line 157
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    invoke-virtual {v1}, Lcom/vk/core/simplescreen/WindowScreenContainer;->show()V

    .line 159
    new-instance v0, Lcom/vk/attachpicker/screen/ViewerScreen;

    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-virtual {v1}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->getItemsCopy()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-virtual {v2}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->delta()I

    move-result v2

    sub-int v2, p2, v2

    iget-boolean v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->preventStyling:Z

    iget-boolean v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->preventStylingPhoto:Z

    iget-boolean v7, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->preventStylingVideo:Z

    iget-wide v8, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->videoMaxLengthMs:J

    iget-boolean v10, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->singleMode:Z

    iget-boolean v11, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->thumb:Z

    move-object v3, p1

    move-object v4, p0

    invoke-direct/range {v0 .. v11}, Lcom/vk/attachpicker/screen/ViewerScreen;-><init>(Ljava/util/ArrayList;ILcom/vk/attachpicker/SelectionContext;Lcom/vk/attachpicker/screen/ViewerScreen$PhotoViewerProvider;ZZZJZZ)V

    .line 161
    .local v0, "screen":Lcom/vk/attachpicker/screen/ViewerScreen;
    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    invoke-virtual {v1, v0}, Lcom/vk/core/simplescreen/WindowScreenContainer;->showScreen(Lcom/vk/core/simplescreen/BaseScreen;)V

    .line 162
    invoke-virtual {v0}, Lcom/vk/attachpicker/screen/ViewerScreen;->animateIn()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    .end local v0    # "screen":Lcom/vk/attachpicker/screen/ViewerScreen;
    :cond_1
    :goto_0
    return-void

    .line 165
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method synthetic lambda$onViewCreated$1(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 188
    invoke-direct {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->dispatchTakePictureIntent()V

    .line 189
    return-void
.end method

.method synthetic lambda$onViewCreated$2(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 191
    invoke-direct {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->dispatchTakeVideoIntent()V

    .line 192
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 10
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v8, -0x1

    .line 365
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 366
    .local v0, "a":Landroid/app/Activity;
    if-nez v0, :cond_1

    .line 453
    :cond_0
    :goto_0
    return-void

    .line 370
    :cond_1
    if-ne p2, v8, :cond_0

    .line 374
    invoke-static {p1}, Lcom/vk/attachpicker/util/CameraUtils;->isRequestValid(I)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 375
    invoke-static {p1}, Lcom/vk/attachpicker/util/CameraUtils;->isVideoRequest(I)Z

    move-result v3

    .line 376
    .local v3, "isVideo":Z
    invoke-static {p1}, Lcom/vk/attachpicker/util/CameraUtils;->getFileById(I)Ljava/io/File;

    move-result-object v2

    .line 378
    .local v2, "file":Ljava/io/File;
    invoke-static {}, Lcom/vk/attachpicker/Picker;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment$$Lambda$6;->lambdaFactory$(Lcom/vk/attachpicker/fragment/GalleryFragment;)Landroid/media/MediaScannerConnection$OnScanCompletedListener;

    move-result-object v7

    invoke-static {v6, v2, v7}, Lcom/vk/attachpicker/util/CameraUtils;->addMediaToGallery(Landroid/content/Context;Ljava/io/File;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V

    .line 380
    iget-boolean v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->preventStyling:Z

    if-nez v6, :cond_3

    if-nez v3, :cond_2

    iget-boolean v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->preventStylingPhoto:Z

    if-nez v6, :cond_3

    :cond_2
    if-eqz v3, :cond_5

    iget-boolean v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->preventStylingVideo:Z

    if-eqz v6, :cond_5

    .line 382
    :cond_3
    if-eqz v3, :cond_4

    .line 383
    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v6

    invoke-static {v6}, Lcom/vk/attachpicker/SelectionContext;->packSingleVideo(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v4

    .line 387
    .local v4, "result":Landroid/content/Intent;
    :goto_1
    invoke-virtual {v0, v8, v4}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 388
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 385
    .end local v4    # "result":Landroid/content/Intent;
    :cond_4
    invoke-static {v2}, Lcom/vk/attachpicker/SelectionContext;->packSinglePhoto(Ljava/io/File;)Landroid/content/Intent;

    move-result-object v4

    .restart local v4    # "result":Landroid/content/Intent;
    goto :goto_1

    .line 391
    .end local v4    # "result":Landroid/content/Intent;
    :cond_5
    :try_start_0
    iget-object v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    if-nez v6, :cond_6

    .line 392
    new-instance v6, Lcom/vk/core/simplescreen/WindowScreenContainer;

    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/vk/core/simplescreen/WindowScreenContainer;-><init>(Landroid/app/Activity;)V

    iput-object v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    .line 394
    :cond_6
    iget-object v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    invoke-virtual {v6}, Lcom/vk/core/simplescreen/WindowScreenContainer;->isShowing()Z

    move-result v6

    if-nez v6, :cond_0

    .line 395
    iget-object v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    invoke-virtual {v6}, Lcom/vk/core/simplescreen/WindowScreenContainer;->show()V

    .line 398
    if-eqz v3, :cond_7

    .line 399
    new-instance v5, Lcom/vk/attachpicker/screen/TrimScreen;

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v6

    iget-wide v8, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->videoMaxLengthMs:J

    const/4 v7, 0x0

    invoke-direct {v5, v6, v8, v9, v7}, Lcom/vk/attachpicker/screen/TrimScreen;-><init>(Landroid/net/Uri;JLcom/vk/attachpicker/screen/TrimScreen$Delegate;)V

    .line 403
    .local v5, "screen":Lcom/vk/core/simplescreen/BaseScreen;
    :goto_2
    iget-object v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    invoke-virtual {v6, v5}, Lcom/vk/core/simplescreen/WindowScreenContainer;->showScreen(Lcom/vk/core/simplescreen/BaseScreen;)V

    goto :goto_0

    .line 405
    .end local v5    # "screen":Lcom/vk/core/simplescreen/BaseScreen;
    :catch_0
    move-exception v1

    .line 406
    .local v1, "e":Ljava/lang/Exception;
    goto :goto_0

    .line 401
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_7
    new-instance v5, Lcom/vk/attachpicker/screen/EditorScreen;

    const/4 v6, 0x0

    iget-boolean v7, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->thumb:Z

    invoke-direct {v5, v2, v6, v7}, Lcom/vk/attachpicker/screen/EditorScreen;-><init>(Ljava/io/File;Lcom/vk/attachpicker/screen/EditorScreen$Delegate;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v5    # "screen":Lcom/vk/core/simplescreen/BaseScreen;
    goto :goto_2

    .line 410
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "isVideo":Z
    .end local v5    # "screen":Lcom/vk/core/simplescreen/BaseScreen;
    :cond_8
    const/4 v6, 0x2

    if-eq p1, v6, :cond_9

    const/4 v6, 0x3

    if-ne p1, v6, :cond_0

    .line 411
    :cond_9
    new-instance v6, Lcom/vk/attachpicker/fragment/GalleryFragment$3;

    invoke-direct {v6, p0, p1, v0}, Lcom/vk/attachpicker/fragment/GalleryFragment$3;-><init>(Lcom/vk/attachpicker/fragment/GalleryFragment;ILandroid/app/Activity;)V

    invoke-static {v0, p3, v6}, Lcom/vk/core/util/IntentUtils;->handleResult(Landroid/app/Activity;Landroid/content/Intent;Lcom/vk/core/util/IntentUtils$ResolveCallback;)V

    goto/16 :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const-wide/16 v6, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 86
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 87
    invoke-static {}, Lcom/vk/attachpicker/events/NotificationCenter;->getInstance()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->selectionUpdateListener:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v0, v4, v1}, Lcom/vk/attachpicker/events/NotificationCenter;->addListener(ILcom/vk/attachpicker/events/NotificationListener;)V

    .line 88
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 89
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "prevent_styling"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->preventStyling:Z

    .line 90
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "prevent_styling_photo"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->preventStylingPhoto:Z

    .line 91
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "prevent_styling_video"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->preventStylingVideo:Z

    .line 92
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "video_max_length_ms"

    invoke-virtual {v0, v1, v6, v7}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->videoMaxLengthMs:J

    .line 93
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "static_header_title"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->staticHeaderTitle:Ljava/lang/String;

    .line 94
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "big_previews"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->bigPreviews:Z

    .line 95
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "camera_enabled"

    invoke-virtual {v0, v1, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->cameraEnabled:Z

    .line 96
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "only_last_n_milliseconds"

    invoke-virtual {v0, v1, v6, v7}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->onlyLastNMilliseconds:J

    .line 97
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "single_mode"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->singleMode:Z

    .line 98
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "media_type"

    const/16 v2, 0xde

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->mediaType:I

    .line 99
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "force_thumb"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->thumb:Z

    .line 101
    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 106
    const v0, 0x7f030195

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 307
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    if-eqz v0, :cond_0

    .line 308
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    invoke-virtual {v0}, Lcom/vk/core/simplescreen/WindowScreenContainer;->onDestroy()V

    .line 309
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    invoke-virtual {v0}, Lcom/vk/core/simplescreen/WindowScreenContainer;->dismiss()V

    .line 311
    :cond_0
    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    .line 312
    invoke-static {}, Lcom/vk/attachpicker/events/NotificationCenter;->getInstance()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->selectionUpdateListener:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/events/NotificationCenter;->removeListener(Lcom/vk/attachpicker/events/NotificationListener;)V

    .line 313
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 299
    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    .line 300
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    if-eqz v0, :cond_0

    .line 301
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    invoke-virtual {v0}, Lcom/vk/core/simplescreen/WindowScreenContainer;->onPause()V

    .line 303
    :cond_0
    return-void
.end method

.method public onPhotoSelected(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V
    .locals 0
    .param p1, "imageEntry"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 361
    return-void
.end method

.method public onPhotoSwitch(II)V
    .locals 4
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I

    .prologue
    .line 344
    const/4 v2, -0x1

    if-ne p1, v2, :cond_1

    .line 357
    :cond_0
    :goto_0
    return-void

    .line 348
    :cond_1
    invoke-virtual {p0, p1}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getPlaceForPhoto(I)Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-result-object v1

    .line 349
    .local v1, "oldObject":Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;
    if-eqz v1, :cond_2

    .line 350
    iget-object v2, v1, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->containerView:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 353
    :cond_2
    invoke-virtual {p0, p2}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getPlaceForPhoto(I)Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;

    move-result-object v0

    .line 354
    .local v0, "newObject":Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;
    if-eqz v0, :cond_0

    .line 355
    iget-object v2, v0, Lcom/vk/attachpicker/screen/ViewerScreen$PlaceProviderObject;->containerView:Landroid/view/View;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 286
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    .line 288
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    if-eqz v0, :cond_0

    .line 289
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->imageViewer:Lcom/vk/core/simplescreen/WindowScreenContainer;

    invoke-virtual {v0}, Lcom/vk/core/simplescreen/WindowScreenContainer;->onResume()V

    .line 292
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-virtual {v0}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->getImagesCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 293
    invoke-direct {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->loadMediastore()V

    .line 295
    :cond_1
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 13
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v12, 0x6f

    const/4 v3, 0x1

    const-wide/16 v10, 0x0

    const/4 v4, 0x0

    .line 111
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vk/attachpicker/fragment/GalleryFragment;->provideToolbar(Landroid/content/Context;)Landroid/view/ViewGroup;

    .line 113
    const v2, 0x7f100467

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/attachpicker/widget/ContextProgressView;

    iput-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->progressView:Lcom/vk/attachpicker/widget/ContextProgressView;

    .line 114
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->progressView:Lcom/vk/attachpicker/widget/ContextProgressView;

    invoke-virtual {v2}, Lcom/vk/attachpicker/widget/ContextProgressView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    new-instance v5, Lcom/vk/attachpicker/fragment/GalleryFragment$1;

    invoke-direct {v5, p0}, Lcom/vk/attachpicker/fragment/GalleryFragment$1;-><init>(Lcom/vk/attachpicker/fragment/GalleryFragment;)V

    invoke-virtual {v2, v5}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 131
    new-instance v2, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const/4 v6, 0x3

    invoke-direct {v2, v5, v6}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    iput-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->gridLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    .line 133
    const v2, 0x7f100432

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    iput-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    .line 134
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->gridLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v2, v5}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 135
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->setHasFixedSize(Z)V

    .line 136
    iget-boolean v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->bigPreviews:Z

    if-eqz v2, :cond_2

    .line 137
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    const v5, 0x7f090024

    invoke-virtual {v2, v5}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->setColumnWidthResId(I)V

    .line 141
    :goto_0
    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    instance-of v2, v2, Lcom/vk/attachpicker/PhotoVideoAttachActivity;

    if-eqz v2, :cond_0

    .line 142
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    invoke-virtual {v5}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getPaddingLeft()I

    move-result v5

    iget-object v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    invoke-virtual {v6}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getPaddingTop()I

    move-result v6

    iget-object v7, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    .line 143
    invoke-virtual {v7}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->getPaddingRight()I

    move-result v7

    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f09012a

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v8

    float-to-int v8, v8

    .line 142
    invoke-virtual {v2, v5, v6, v7, v8}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->setPadding(IIII)V

    .line 146
    :cond_0
    invoke-direct {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getSelectionContext()Lcom/vk/attachpicker/SelectionContext;

    move-result-object v1

    .line 147
    .local v1, "selectionContext":Lcom/vk/attachpicker/SelectionContext;
    new-instance v2, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-virtual {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    iget-boolean v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->singleMode:Z

    invoke-direct {v2, v5, v1, v6}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;-><init>(Landroid/content/Context;Lcom/vk/attachpicker/SelectionContext;Z)V

    iput-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    .line 148
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-virtual {v2, v5}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 149
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-static {p0, v1}, Lcom/vk/attachpicker/fragment/GalleryFragment$$Lambda$2;->lambdaFactory$(Lcom/vk/attachpicker/fragment/GalleryFragment;Lcom/vk/attachpicker/SelectionContext;)Lcom/vk/attachpicker/widget/OnItemClickListener;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->setItemClickListener(Lcom/vk/attachpicker/widget/OnItemClickListener;)V

    .line 171
    iget v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->mediaType:I

    if-ne v2, v12, :cond_3

    iget-wide v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->onlyLastNMilliseconds:J

    cmp-long v2, v6, v10

    if-nez v2, :cond_3

    .line 172
    invoke-static {}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->lastLoadedPhotoVideo()Ljava/util/ArrayList;

    move-result-object v0

    .line 180
    .local v0, "lastLoadedMediaStore":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    :goto_1
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 181
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->progressView:Lcom/vk/attachpicker/widget/ContextProgressView;

    const/16 v5, 0x8

    invoke-virtual {v2, v5}, Lcom/vk/attachpicker/widget/ContextProgressView;->setVisibility(I)V

    .line 182
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    invoke-virtual {v2, v4}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->setVisibility(I)V

    .line 183
    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    invoke-virtual {v2}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getBucketImages()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v5, v2}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->setImages(Ljava/util/ArrayList;)V

    .line 184
    invoke-direct {p0, v0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->initSpinner(Ljava/util/ArrayList;)V

    .line 186
    :cond_1
    iget-object v5, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    iget-boolean v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->cameraEnabled:Z

    if-eqz v2, :cond_6

    iget v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->mediaType:I

    if-ne v2, v12, :cond_6

    invoke-static {}, Lcom/vk/attachpicker/util/CameraUtils;->isDeviceHasCamera()Z

    move-result v2

    if-eqz v2, :cond_6

    move v2, v3

    :goto_2
    invoke-virtual {v5, v2}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->setCameraEnabled(Z)V

    .line 187
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-static {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment$$Lambda$3;->lambdaFactory$(Lcom/vk/attachpicker/fragment/GalleryFragment;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->setPhotoClickListener(Landroid/view/View$OnClickListener;)V

    .line 190
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->adapter:Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;

    invoke-static {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment$$Lambda$4;->lambdaFactory$(Lcom/vk/attachpicker/fragment/GalleryFragment;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/adapter/PhotoSmallAdapter;->setVideoClickListener(Landroid/view/View$OnClickListener;)V

    .line 194
    invoke-direct {p0}, Lcom/vk/attachpicker/fragment/GalleryFragment;->loadMediastore()V

    .line 195
    return-void

    .line 139
    .end local v0    # "lastLoadedMediaStore":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    .end local v1    # "selectionContext":Lcom/vk/attachpicker/SelectionContext;
    :cond_2
    iget-object v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->recyclerView:Lcom/vk/attachpicker/widget/GalleryRecyclerView;

    const v5, 0x7f090025

    invoke-virtual {v2, v5}, Lcom/vk/attachpicker/widget/GalleryRecyclerView;->setColumnWidthResId(I)V

    goto/16 :goto_0

    .line 173
    .restart local v1    # "selectionContext":Lcom/vk/attachpicker/SelectionContext;
    :cond_3
    iget v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->mediaType:I

    const/16 v5, 0x14d

    if-ne v2, v5, :cond_4

    iget-wide v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->onlyLastNMilliseconds:J

    cmp-long v2, v6, v10

    if-nez v2, :cond_4

    .line 174
    invoke-static {}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->lastLoadedVideo()Ljava/util/ArrayList;

    move-result-object v0

    .restart local v0    # "lastLoadedMediaStore":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    goto :goto_1

    .line 175
    .end local v0    # "lastLoadedMediaStore":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    :cond_4
    iget v2, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->mediaType:I

    const/16 v5, 0xde

    if-ne v2, v5, :cond_5

    iget-wide v6, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->onlyLastNMilliseconds:J

    cmp-long v2, v6, v10

    if-nez v2, :cond_5

    .line 176
    invoke-static {}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->lastLoadedPhoto()Ljava/util/ArrayList;

    move-result-object v0

    .restart local v0    # "lastLoadedMediaStore":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    goto :goto_1

    .line 178
    .end local v0    # "lastLoadedMediaStore":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    :cond_5
    const/4 v0, 0x0

    .restart local v0    # "lastLoadedMediaStore":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    goto :goto_1

    :cond_6
    move v2, v4

    .line 186
    goto :goto_2
.end method

.method public provideToolbar(Landroid/content/Context;)Landroid/view/ViewGroup;
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/16 v2, 0x10

    const/4 v5, 0x0

    const/4 v4, -0x1

    const/4 v3, -0x2

    .line 457
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->toolbarContainer:Landroid/widget/FrameLayout;

    if-nez v0, :cond_0

    .line 458
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->toolbarContainer:Landroid/widget/FrameLayout;

    .line 459
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->toolbarContainer:Landroid/widget/FrameLayout;

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    invoke-virtual {v0, v1, v5, v2, v5}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 460
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->staticHeaderTitle:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 461
    new-instance v0, Lcom/vk/attachpicker/widget/CustomSpinner;

    invoke-direct {v0, p1}, Lcom/vk/attachpicker/widget/CustomSpinner;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->spinner:Lcom/vk/attachpicker/widget/CustomSpinner;

    .line 462
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->spinner:Lcom/vk/attachpicker/widget/CustomSpinner;

    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v1

    int-to-float v1, v1

    const v2, 0x3f2aaaab

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/CustomSpinner;->setDropDownWidth(I)V

    .line 463
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->spinner:Lcom/vk/attachpicker/widget/CustomSpinner;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/CustomSpinner;->setVisibility(I)V

    .line 464
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->toolbarContainer:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->spinner:Lcom/vk/attachpicker/widget/CustomSpinner;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 475
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->toolbarContainer:Landroid/widget/FrameLayout;

    return-object v0

    .line 466
    :cond_1
    new-instance v0, Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    invoke-direct {v0, p1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->staticTitle:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    .line 467
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->staticTitle:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    const v1, -0x6f6b67

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setTextColor(I)V

    .line 468
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->staticTitle:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->staticHeaderTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setText(Ljava/lang/CharSequence;)V

    .line 469
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->staticTitle:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setAllCaps(Z)V

    .line 470
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->staticTitle:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    const/16 v1, 0x13

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setGravity(I)V

    .line 471
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->staticTitle:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;->setTextSize(F)V

    .line 472
    iget-object v0, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->toolbarContainer:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->staticTitle:Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method public setStaticHeaderTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "staticHeaderTitle"    # Ljava/lang/String;

    .prologue
    .line 198
    iput-object p1, p0, Lcom/vk/attachpicker/fragment/GalleryFragment;->staticHeaderTitle:Ljava/lang/String;

    .line 199
    return-void
.end method
