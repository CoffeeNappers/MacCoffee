.class final Lcom/vkontakte/android/audio/AudioFacade$1;
.super Lcom/vkontakte/android/audio/player/PlayerConnectionListener$PlayerConnectionListenerAdapter;
.source "AudioFacade.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/audio/AudioFacade;->bind(Landroid/content/Context;Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$o:Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;)V
    .locals 0

    .prologue
    .line 68
    iput-object p1, p0, Lcom/vkontakte/android/audio/AudioFacade$1;->val$o:Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;

    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerConnectionListener$PlayerConnectionListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onConnected()V
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioFacade$1;->val$o:Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lcom/vkontakte/android/audio/AudioFacade$1$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/audio/AudioFacade$OnConnectionListener;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 72
    return-void
.end method
