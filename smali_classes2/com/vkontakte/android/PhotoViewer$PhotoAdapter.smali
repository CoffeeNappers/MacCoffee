.class Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;
.super Ljava/lang/Object;
.source "PhotoViewer.java"

# interfaces
.implements Lcom/vkontakte/android/ui/PhotoView$PhotoViewerAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/PhotoViewer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PhotoAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/PhotoViewer;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/PhotoViewer;)V
    .locals 0

    .prologue
    .line 1179
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/PhotoViewer;Lcom/vkontakte/android/PhotoViewer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/PhotoViewer;
    .param p2, "x1"    # Lcom/vkontakte/android/PhotoViewer$1;

    .prologue
    .line 1179
    invoke-direct {p0, p1}, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;-><init>(Lcom/vkontakte/android/PhotoViewer;)V

    return-void
.end method


# virtual methods
.method public allowZoom(I)Z
    .locals 1
    .param p1, "num"    # I

    .prologue
    .line 1219
    const/4 v0, 0x1

    return v0
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 1182
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$3200(Lcom/vkontakte/android/PhotoViewer;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1183
    const/4 v0, 0x1

    .line 1185
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$1700(Lcom/vkontakte/android/PhotoViewer;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getPhoto(I)Lcom/vkontakte/android/ui/PhotoView$RunnableFuture;
    .locals 3
    .param p1, "num"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/vkontakte/android/ui/PhotoView$RunnableFuture",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1195
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$3200(Lcom/vkontakte/android/PhotoViewer;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1196
    new-instance v0, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;

    iget-object v1, p0, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/PhotoViewer$DocPhotoLoader;-><init>(Lcom/vkontakte/android/PhotoViewer;)V

    .line 1198
    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$1700(Lcom/vkontakte/android/PhotoViewer;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Photo;

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/PhotoViewer$PhotoLoader;-><init>(Lcom/vkontakte/android/PhotoViewer;Lcom/vkontakte/android/Photo;)V

    move-object v0, v1

    goto :goto_0
.end method

.method public getPhotoLoadProgress(I)F
    .locals 1
    .param p1, "num"    # I

    .prologue
    .line 1208
    const/4 v0, 0x0

    return v0
.end method

.method public getThumb(I)Landroid/graphics/Bitmap;
    .locals 5
    .param p1, "num"    # I

    .prologue
    const/4 v2, 0x0

    .line 1225
    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v3}, Lcom/vkontakte/android/PhotoViewer;->access$3200(Lcom/vkontakte/android/PhotoViewer;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 1237
    :cond_0
    :goto_0
    return-object v2

    .line 1228
    :cond_1
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->getCount()I

    move-result v3

    if-ge p1, v3, :cond_0

    .line 1231
    iget-object v3, p0, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v3}, Lcom/vkontakte/android/PhotoViewer;->access$1700(Lcom/vkontakte/android/PhotoViewer;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/Photo;

    .line 1232
    .local v1, "ph":Lcom/vkontakte/android/Photo;
    iget-object v3, v1, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Photo$Image;

    .line 1233
    .local v0, "im":Lcom/vkontakte/android/Photo$Image;
    iget-object v4, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-static {v4}, Lcom/vk/imageloader/VKImageLoader;->isInCache(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1234
    iget-object v2, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;)Lio/reactivex/Observable;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    goto :goto_0
.end method

.method public isCached(I)Z
    .locals 4
    .param p1, "num"    # I

    .prologue
    const/16 v3, 0x78

    .line 1243
    if-ltz p1, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v2}, Lcom/vkontakte/android/PhotoViewer;->access$1700(Lcom/vkontakte/android/PhotoViewer;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt p1, v2, :cond_1

    .line 1244
    :cond_0
    const/4 v2, 0x0

    .line 1248
    :goto_0
    return v2

    .line 1246
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v2}, Lcom/vkontakte/android/PhotoViewer;->access$1700(Lcom/vkontakte/android/PhotoViewer;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Photo;

    .line 1247
    .local v0, "photo":Lcom/vkontakte/android/Photo;
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$PhotoAdapter;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iget-boolean v2, v2, Lcom/vkontakte/android/PhotoViewer;->useSmall:Z

    if-eqz v2, :cond_2

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v2

    iget-object v1, v2, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .line 1248
    .local v1, "url":Ljava/lang/String;
    :goto_1
    invoke-static {v1}, Lcom/vk/imageloader/VKImageLoader;->isInCache(Ljava/lang/String;)Z

    move-result v2

    goto :goto_0

    .line 1247
    .end local v1    # "url":Ljava/lang/String;
    :cond_2
    const/16 v2, 0x79

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/Photo;->getImage(CC)Lcom/vkontakte/android/Photo$Image;

    move-result-object v2

    iget-object v1, v2, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    goto :goto_1
.end method

.method public isPhotoLoaded(I)Z
    .locals 1
    .param p1, "num"    # I

    .prologue
    .line 1190
    const/4 v0, 0x0

    return v0
.end method

.method public requestPhotoDownload(I)V
    .locals 0
    .param p1, "num"    # I

    .prologue
    .line 1204
    return-void
.end method

.method public shouldPreload()Z
    .locals 1

    .prologue
    .line 1213
    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->isMobile()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
