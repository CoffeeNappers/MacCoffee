.class final synthetic Lcom/vkontakte/android/api/VKAPIRequest$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/api/VKAPIRequest;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/api/VKAPIRequest;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/api/VKAPIRequest$$Lambda$1;->arg$1:Lcom/vkontakte/android/api/VKAPIRequest;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/api/VKAPIRequest;)Landroid/content/DialogInterface$OnCancelListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/api/VKAPIRequest$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest$$Lambda$1;-><init>(Lcom/vkontakte/android/api/VKAPIRequest;)V

    return-object v0
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/api/VKAPIRequest$$Lambda$1;->arg$1:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->lambda$wrapProgress$0(Landroid/content/DialogInterface;)V

    return-void
.end method
