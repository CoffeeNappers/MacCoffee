.class public final Lcom/vk/music/model/TabbedMusicModel;
.super Lcom/vk/music/model/MergeModel;
.source "TabbedMusicModel.java"

# interfaces
.implements Lcom/vk/music/model/ActiveModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/model/TabbedMusicModel$View;
    }
.end annotation


# instance fields
.field private page:I


# direct methods
.method public constructor <init>(Z)V
    .locals 5
    .param p1, "openRecommendations"    # Z

    .prologue
    const/4 v4, 0x1

    .line 34
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vk/music/model/ActiveModel;

    const/4 v1, 0x0

    new-instance v2, Lcom/vk/music/model/MusicModelImpl;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    invoke-direct {v2, v3}, Lcom/vk/music/model/MusicModelImpl;-><init>(I)V

    aput-object v2, v0, v1

    new-instance v1, Lcom/vk/music/model/RecommendedModelImpl;

    invoke-direct {v1}, Lcom/vk/music/model/RecommendedModelImpl;-><init>()V

    aput-object v1, v0, v4

    invoke-direct {p0, v0}, Lcom/vk/music/model/MergeModel;-><init>([Lcom/vk/music/model/ActiveModel;)V

    .line 35
    if-eqz p1, :cond_0

    .line 36
    iput v4, p0, Lcom/vk/music/model/TabbedMusicModel;->page:I

    .line 38
    :cond_0
    return-void
.end method


# virtual methods
.method public getMusicModel()Lcom/vk/music/model/MusicModel;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/music/model/TabbedMusicModel;->model(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/model/MusicModel;

    return-object v0
.end method

.method public getPage()I
    .locals 1

    .prologue
    .line 42
    iget v0, p0, Lcom/vk/music/model/TabbedMusicModel;->page:I

    return v0
.end method

.method public getRecommendedModel()Lcom/vk/music/model/RecommendedModel;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 56
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vk/music/model/TabbedMusicModel;->model(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/model/RecommendedModel;

    return-object v0
.end method

.method public setPage(I)V
    .locals 0
    .param p1, "page"    # I

    .prologue
    .line 46
    iput p1, p0, Lcom/vk/music/model/TabbedMusicModel;->page:I

    .line 47
    return-void
.end method
