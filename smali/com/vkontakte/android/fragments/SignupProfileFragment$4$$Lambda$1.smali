.class final synthetic Lcom/vkontakte/android/fragments/SignupProfileFragment$4$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/SignupProfileFragment$4;

.field private final arg$2:Landroid/graphics/Bitmap;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/SignupProfileFragment$4;Landroid/graphics/Bitmap;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/SignupProfileFragment$4;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4$$Lambda$1;->arg$2:Landroid/graphics/Bitmap;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/SignupProfileFragment$4;Landroid/graphics/Bitmap;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/SignupProfileFragment$4$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/SignupProfileFragment$4;Landroid/graphics/Bitmap;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/SignupProfileFragment$4;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4$$Lambda$1;->arg$2:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->lambda$run$0(Landroid/graphics/Bitmap;)V

    return-void
.end method
