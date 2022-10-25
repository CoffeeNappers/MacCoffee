.class final synthetic Lcom/vkontakte/android/RepostActivity$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/RepostActivity;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/RepostActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/RepostActivity$$Lambda$4;->arg$1:Lcom/vkontakte/android/RepostActivity;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/RepostActivity;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/RepostActivity$$Lambda$4;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/RepostActivity$$Lambda$4;-><init>(Lcom/vkontakte/android/RepostActivity;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$$Lambda$4;->arg$1:Lcom/vkontakte/android/RepostActivity;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/RepostActivity;->lambda$repostWithComment$3(Landroid/content/DialogInterface;I)V

    return-void
.end method
