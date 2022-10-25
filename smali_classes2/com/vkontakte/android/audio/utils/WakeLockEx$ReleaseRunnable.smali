.class Lcom/vkontakte/android/audio/utils/WakeLockEx$ReleaseRunnable;
.super Ljava/lang/Object;
.source "WakeLockEx.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/utils/WakeLockEx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReleaseRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/audio/utils/WakeLockEx;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/utils/WakeLockEx;)V
    .locals 0

    .prologue
    .line 46
    iput-object p1, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx$ReleaseRunnable;->this$0:Lcom/vkontakte/android/audio/utils/WakeLockEx;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/utils/WakeLockEx;Lcom/vkontakte/android/audio/utils/WakeLockEx$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/utils/WakeLockEx;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/utils/WakeLockEx$1;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/utils/WakeLockEx$ReleaseRunnable;-><init>(Lcom/vkontakte/android/audio/utils/WakeLockEx;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx$ReleaseRunnable;->this$0:Lcom/vkontakte/android/audio/utils/WakeLockEx;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/WakeLockEx;->access$102(Lcom/vkontakte/android/audio/utils/WakeLockEx;Lcom/vkontakte/android/audio/utils/Delay;)Lcom/vkontakte/android/audio/utils/Delay;

    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/WakeLockEx$ReleaseRunnable;->this$0:Lcom/vkontakte/android/audio/utils/WakeLockEx;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/audio/utils/WakeLockEx;->release(J)V

    .line 51
    return-void
.end method
