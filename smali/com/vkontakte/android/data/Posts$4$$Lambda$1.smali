.class final synthetic Lcom/vkontakte/android/data/Posts$4$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Landroid/app/Activity;


# direct methods
.method private constructor <init>(Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/data/Posts$4$$Lambda$1;->arg$1:Landroid/app/Activity;

    return-void
.end method

.method public static lambdaFactory$(Landroid/app/Activity;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/data/Posts$4$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/data/Posts$4$$Lambda$1;-><init>(Landroid/app/Activity;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/data/Posts$4$$Lambda$1;->arg$1:Landroid/app/Activity;

    invoke-static {v0}, Lcom/vkontakte/android/data/Posts$4;->lambda$fail$0(Landroid/app/Activity;)V

    return-void
.end method
