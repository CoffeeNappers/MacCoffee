.class Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;
.super Ljava/lang/Object;
.source "MediaPlayerHelper.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnBufferingUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/MediaPlayerHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyPlayerListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)V
    .locals 0

    .prologue
    .line 207
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;Lcom/vkontakte/android/audio/player/MediaPlayerHelper$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelper;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelper$1;

    .prologue
    .line 207
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;-><init>(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)V

    return-void
.end method


# virtual methods
.method public onBufferingUpdate(Landroid/media/MediaPlayer;I)V
    .locals 2
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "percent"    # I

    .prologue
    .line 244
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->access$200(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-interface {v0, v1, p2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onBufferingProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V

    .line 245
    return-void
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    .line 210
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->stop()V

    .line 211
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->access$200(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-interface {v0, v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onCompleted(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;)V

    .line 212
    return-void
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 4
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    const/4 v3, 0x1

    .line 216
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    const/4 v1, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 217
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->stop()V

    .line 218
    sparse-switch p3, :sswitch_data_0

    .line 226
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->access$200(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    sget-object v2, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;->unknown:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onError(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;)V

    .line 229
    :goto_0
    return v3

    .line 220
    :sswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->access$200(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    sget-object v2, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;->timeout:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onError(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;)V

    goto :goto_0

    .line 223
    :sswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->access$200(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    sget-object v2, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;->unsupported:Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onError(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;)V

    goto :goto_0

    .line 218
    nop

    :sswitch_data_0
    .sparse-switch
        -0x3f2 -> :sswitch_1
        -0x6e -> :sswitch_0
    .end sparse-switch
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 3
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    .line 234
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->access$302(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;Z)Z

    .line 235
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->access$400(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v0

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v0, v1, :cond_0

    .line 236
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->access$500(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 237
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->access$600(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)V

    .line 239
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-static {v0}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->access$200(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/MediaPlayerHelper$MyPlayerListener;->this$0:Lcom/vkontakte/android/audio/player/MediaPlayerHelper;

    invoke-static {v2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelper;->access$500(Lcom/vkontakte/android/audio/player/MediaPlayerHelper;)Landroid/media/MediaPlayer;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;->onPrepared(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V

    .line 240
    return-void
.end method
