.class final synthetic Lcom/vkontakte/android/CaptchaActivity$$Lambda$6;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/CaptchaActivity;

.field private final arg$2:Landroid/graphics/Bitmap;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/CaptchaActivity;Landroid/graphics/Bitmap;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/CaptchaActivity$$Lambda$6;->arg$1:Lcom/vkontakte/android/CaptchaActivity;

    iput-object p2, p0, Lcom/vkontakte/android/CaptchaActivity$$Lambda$6;->arg$2:Landroid/graphics/Bitmap;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/CaptchaActivity;Landroid/graphics/Bitmap;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/CaptchaActivity$$Lambda$6;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/CaptchaActivity$$Lambda$6;-><init>(Lcom/vkontakte/android/CaptchaActivity;Landroid/graphics/Bitmap;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/CaptchaActivity$$Lambda$6;->arg$1:Lcom/vkontakte/android/CaptchaActivity;

    iget-object v1, p0, Lcom/vkontakte/android/CaptchaActivity$$Lambda$6;->arg$2:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/CaptchaActivity;->lambda$displayImage$5(Landroid/graphics/Bitmap;)V

    return-void
.end method
