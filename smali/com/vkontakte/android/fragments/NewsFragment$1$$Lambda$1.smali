.class final synthetic Lcom/vkontakte/android/fragments/NewsFragment$1$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/NewsFragment$1;

.field private final arg$2:Landroid/content/Intent;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment$1;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$1$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/NewsFragment$1;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/NewsFragment$1$$Lambda$1;->arg$2:Landroid/content/Intent;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment$1;Landroid/content/Intent;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/NewsFragment$1$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/NewsFragment$1$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/NewsFragment$1;Landroid/content/Intent;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$1$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/NewsFragment$1;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$1$$Lambda$1;->arg$2:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/NewsFragment$1;->lambda$onReceive$0(Landroid/content/Intent;)V

    return-void
.end method
