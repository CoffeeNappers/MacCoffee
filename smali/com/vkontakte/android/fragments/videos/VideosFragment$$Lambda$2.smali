.class final synthetic Lcom/vkontakte/android/fragments/videos/VideosFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/dialogs/PromptDialog$Listener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/videos/VideosFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/videos/VideosFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/videos/VideosFragment;)Lcom/vkontakte/android/dialogs/PromptDialog$Listener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/videos/VideosFragment$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/videos/VideosFragment;)V

    return-object v0
.end method


# virtual methods
.method public onFinish(Ljava/lang/CharSequence;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->lambda$showAddLinkDialog$1(Ljava/lang/CharSequence;)V

    return-void
.end method
