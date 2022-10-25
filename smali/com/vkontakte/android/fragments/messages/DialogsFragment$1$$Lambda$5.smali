.class final synthetic Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$5;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;

.field private final arg$2:Lcom/vkontakte/android/Message;

.field private final arg$3:Landroid/content/Intent;

.field private final arg$4:I


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;Lcom/vkontakte/android/Message;Landroid/content/Intent;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$5;->arg$1:Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$5;->arg$2:Lcom/vkontakte/android/Message;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$5;->arg$3:Landroid/content/Intent;

    iput p4, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$5;->arg$4:I

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;Lcom/vkontakte/android/Message;Landroid/content/Intent;I)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$5;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$5;-><init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;Lcom/vkontakte/android/Message;Landroid/content/Intent;I)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 4
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$5;->arg$1:Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$5;->arg$2:Lcom/vkontakte/android/Message;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$5;->arg$3:Landroid/content/Intent;

    iget v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$5;->arg$4:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->lambda$null$0(Lcom/vkontakte/android/Message;Landroid/content/Intent;I)V

    return-void
.end method
