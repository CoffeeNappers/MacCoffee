.class Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$ShowProgressRunnable;
.super Ljava/lang/Object;
.source "VideoAttachment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ShowProgressRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

.field private final video:Lcom/vkontakte/android/api/VideoFile;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;Lcom/vkontakte/android/api/VideoFile;)V
    .locals 0
    .param p2, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 1162
    iput-object p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$ShowProgressRunnable;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1163
    iput-object p2, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$ShowProgressRunnable;->video:Lcom/vkontakte/android/api/VideoFile;

    .line 1164
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1168
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$ShowProgressRunnable;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$ShowProgressRunnable;->video:Lcom/vkontakte/android/api/VideoFile;

    if-ne v0, v1, :cond_0

    .line 1169
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder$ShowProgressRunnable;->this$0:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;->showProgress()V

    .line 1171
    :cond_0
    return-void
.end method
