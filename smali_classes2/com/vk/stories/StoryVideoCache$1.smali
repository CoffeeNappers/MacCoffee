.class final Lcom/vk/stories/StoryVideoCache$1;
.super Ljava/lang/Object;
.source "StoryVideoCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/StoryVideoCache;->getVideoUrl(Lcom/vk/stories/model/StoryEntry;Lcom/vk/stories/StoryVideoCache$UrlCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$entry:Lcom/vk/stories/model/StoryEntry;

.field final synthetic val$urlCallback:Lcom/vk/stories/StoryVideoCache$UrlCallback;


# direct methods
.method constructor <init>(Lcom/vk/stories/StoryVideoCache$UrlCallback;Lcom/vk/stories/model/StoryEntry;)V
    .locals 0

    .prologue
    .line 41
    iput-object p1, p0, Lcom/vk/stories/StoryVideoCache$1;->val$urlCallback:Lcom/vk/stories/StoryVideoCache$UrlCallback;

    iput-object p2, p0, Lcom/vk/stories/StoryVideoCache$1;->val$entry:Lcom/vk/stories/model/StoryEntry;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vk/stories/StoryVideoCache$1;->val$urlCallback:Lcom/vk/stories/StoryVideoCache$UrlCallback;

    invoke-static {}, Lcom/vk/stories/StoryVideoCache;->access$000()Lcom/danikula/videocache/HttpProxyCacheServer;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/stories/StoryVideoCache$1;->val$entry:Lcom/vk/stories/model/StoryEntry;

    invoke-virtual {v2}, Lcom/vk/stories/model/StoryEntry;->getVideoUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/danikula/videocache/HttpProxyCacheServer;->getProxyUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/stories/StoryVideoCache$UrlCallback;->onLinkReady(Ljava/lang/String;)V

    .line 45
    return-void
.end method
