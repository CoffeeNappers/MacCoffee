.class Lcom/vkontakte/android/media/audio/AudioMessageUtils$1;
.super Ljava/lang/Object;
.source "AudioMessageUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/media/audio/AudioMessageUtils;->stopRecordingInternal(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .prologue
    .line 268
    iput-object p1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$1;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 271
    invoke-static {}, Lcom/vk/medianative/MediaNative;->nativeAudioStopRecord()V

    .line 272
    return-void
.end method
