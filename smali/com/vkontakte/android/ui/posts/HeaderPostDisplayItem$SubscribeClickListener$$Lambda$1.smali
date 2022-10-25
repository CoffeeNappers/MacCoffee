.class final synthetic Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/F0;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;)Lcom/vkontakte/android/functions/F0;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener$$Lambda$1;-><init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;)V

    return-object v0
.end method


# virtual methods
.method public f()Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener$$Lambda$1;->arg$1:Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$SubscribeClickListener;->lambda$new$0()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method
