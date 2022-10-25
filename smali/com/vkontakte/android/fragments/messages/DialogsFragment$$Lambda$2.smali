.class final synthetic Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

.field private final arg$2:Landroid/view/LayoutInflater;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Landroid/view/LayoutInflater;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$2;->arg$2:Landroid/view/LayoutInflater;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Landroid/view/LayoutInflater;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$2;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Landroid/view/LayoutInflater;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$2;->arg$2:Landroid/view/LayoutInflater;

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->lambda$onCreateContentView$1(Landroid/view/LayoutInflater;Landroid/view/View;)V

    return-void
.end method
