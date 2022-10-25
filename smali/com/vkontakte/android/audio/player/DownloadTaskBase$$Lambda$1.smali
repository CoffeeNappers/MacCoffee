.class final synthetic Lcom/vkontakte/android/audio/player/DownloadTaskBase$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/VoidF2;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$$Lambda$1;->arg$1:Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;)Lcom/vkontakte/android/functions/VoidF2;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$$Lambda$1;-><init>(Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;)V

    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$$Lambda$1;->arg$1:Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;

    check-cast p1, Ljava/lang/Long;

    check-cast p2, Ljava/lang/Long;

    invoke-static {v0, p1, p2}, Lcom/vkontakte/android/audio/player/DownloadTaskBase;->lambda$downloadTracks$0(Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;Ljava/lang/Long;Ljava/lang/Long;)V

    return-void
.end method
