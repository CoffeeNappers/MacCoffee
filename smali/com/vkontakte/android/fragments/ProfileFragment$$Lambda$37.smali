.class final synthetic Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$37;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/ProfileFragment;

.field private final arg$2:Landroid/view/View;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$37;->arg$1:Lcom/vkontakte/android/fragments/ProfileFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$37;->arg$2:Landroid/view/View;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$37;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$37;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$37;->arg$1:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$37;->arg$2:Landroid/view/View;

    invoke-virtual {v0, v1, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment;->lambda$addFriend$36(Landroid/view/View;Landroid/content/DialogInterface;I)V

    return-void
.end method
