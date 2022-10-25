.class public Lcom/vkontakte/android/fragments/fave/FaveVideoListFragment;
.super Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;
.source "FaveVideoListFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/videos/AbsVideoListFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected getOwnerID()I
    .locals 1

    .prologue
    .line 15
    const/4 v0, 0x0

    return v0
.end method

.method protected getReferer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    const-string/jumbo v0, "fave"

    return-object v0
.end method

.method protected getRequest(II)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 1
    .param p1, "offset"    # I
    .param p2, "count"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 26
    invoke-static {p1, p2}, Lcom/vkontakte/android/api/video/VideoGet;->getBookmarks(II)Lcom/vkontakte/android/api/video/VideoGet;

    move-result-object v0

    return-object v0
.end method
