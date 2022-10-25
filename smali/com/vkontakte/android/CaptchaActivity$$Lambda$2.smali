.class final synthetic Lcom/vkontakte/android/CaptchaActivity$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/CaptchaActivity;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/CaptchaActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/CaptchaActivity$$Lambda$2;->arg$1:Lcom/vkontakte/android/CaptchaActivity;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/CaptchaActivity;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/CaptchaActivity$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/CaptchaActivity$$Lambda$2;-><init>(Lcom/vkontakte/android/CaptchaActivity;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/CaptchaActivity$$Lambda$2;->arg$1:Lcom/vkontakte/android/CaptchaActivity;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/CaptchaActivity;->lambda$onCreate$1(Landroid/content/DialogInterface;I)V

    return-void
.end method
