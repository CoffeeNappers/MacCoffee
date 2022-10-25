.class final synthetic Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;

.field private final arg$2:Lcom/vkontakte/android/Message;

.field private final arg$3:Landroid/content/Intent;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;Lcom/vkontakte/android/Message;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$1;->arg$2:Lcom/vkontakte/android/Message;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$1;->arg$3:Landroid/content/Intent;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;Lcom/vkontakte/android/Message;Landroid/content/Intent;)Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;Lcom/vkontakte/android/Message;Landroid/content/Intent;)V

    return-object v0
.end method


# virtual methods
.method public onUnreadCountLoaded(II)V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$1;->arg$2:Lcom/vkontakte/android/Message;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$1;->arg$3:Landroid/content/Intent;

    invoke-virtual {v0, v1, v2, p1, p2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->lambda$onReceive$3(Lcom/vkontakte/android/Message;Landroid/content/Intent;II)V

    return-void
.end method
