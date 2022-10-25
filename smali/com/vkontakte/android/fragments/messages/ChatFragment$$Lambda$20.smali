.class final synthetic Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$20;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment;

.field private final arg$2:Ljava/util/ArrayList;

.field private final arg$3:Lcom/vkontakte/android/Message;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/ArrayList;Lcom/vkontakte/android/Message;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$20;->arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$20;->arg$2:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$20;->arg$3:Lcom/vkontakte/android/Message;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/ArrayList;Lcom/vkontakte/android/Message;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$20;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$20;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/ArrayList;Lcom/vkontakte/android/Message;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$20;->arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$20;->arg$2:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$20;->arg$3:Lcom/vkontakte/android/Message;

    invoke-virtual {v0, v1, v2, p1, p2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->lambda$showMessageOptions$20(Ljava/util/ArrayList;Lcom/vkontakte/android/Message;Landroid/content/DialogInterface;I)V

    return-void
.end method
