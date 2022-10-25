.class final synthetic Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$21;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment;

.field private final arg$2:Ljava/util/List;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$21;->arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$21;->arg$2:Ljava/util/List;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/List;)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$21;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$21;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$21;->arg$1:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$21;->arg$2:Ljava/util/List;

    invoke-virtual {v0, v1, p1, p2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->lambda$confirmAndDelete$21(Ljava/util/List;Landroid/content/DialogInterface;I)V

    return-void
.end method
