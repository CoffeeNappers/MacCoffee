.class Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProfilePhotoViewerCallback"
.end annotation


# instance fields
.field private loading:Z

.field private offset:I

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

.field private total:I

.field public viewer:Lcom/vkontakte/android/PhotoViewer;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;II)V
    .locals 1
    .param p2, "offset"    # I
    .param p3, "total"    # I

    .prologue
    .line 4482
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4477
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->loading:Z

    .line 4483
    iput p2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->offset:I

    .line 4484
    iput p3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->total:I

    .line 4485
    return-void
.end method

.method static synthetic access$8700(Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;

    .prologue
    .line 4475
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->offset:I

    return v0
.end method

.method static synthetic access$8702(Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;
    .param p1, "x1"    # I

    .prologue
    .line 4475
    iput p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->offset:I

    return p1
.end method

.method static synthetic access$8802(Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;
    .param p1, "x1"    # I

    .prologue
    .line 4475
    iput p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->total:I

    return p1
.end method

.method static synthetic access$8902(Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;
    .param p1, "x1"    # Z

    .prologue
    .line 4475
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->loading:Z

    return p1
.end method


# virtual methods
.method public getPhotoBounds(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 0
    .param p1, "index"    # I
    .param p2, "outRect"    # Landroid/graphics/Rect;
    .param p3, "outClip"    # Landroid/graphics/Rect;

    .prologue
    .line 4490
    return-void
.end method

.method public isMoreAvailable()Z
    .locals 2

    .prologue
    .line 4494
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->offset:I

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->total:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public loadMore()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 4499
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->loading:Z

    if-eqz v0, :cond_0

    .line 4519
    :goto_0
    return-void

    .line 4502
    :cond_0
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->loading:Z

    .line 4503
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosGet;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    const/4 v2, -0x6

    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->offset:I

    const/16 v4, 0x64

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/photos/PhotosGet;-><init>(IIIIZ)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback$1;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;)V

    .line 4504
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 4518
    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public onDismissed()V
    .locals 0

    .prologue
    .line 4524
    return-void
.end method
