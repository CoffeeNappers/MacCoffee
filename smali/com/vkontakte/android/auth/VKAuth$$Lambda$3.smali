.class final synthetic Lcom/vkontakte/android/auth/VKAuth$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/auth/VKAuth$$Lambda$3;->arg$1:Landroid/content/Context;

    return-void
.end method

.method public static lambdaFactory$(Landroid/content/Context;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/auth/VKAuth$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/auth/VKAuth$$Lambda$3;-><init>(Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$$Lambda$3;->arg$1:Landroid/content/Context;

    invoke-static {v0, p1, p2}, Lcom/vkontakte/android/auth/VKAuth;->lambda$ensureLoggedIn$4(Landroid/content/Context;Landroid/content/DialogInterface;I)V

    return-void
.end method
