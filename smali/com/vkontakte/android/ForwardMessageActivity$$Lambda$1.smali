.class final synthetic Lcom/vkontakte/android/ForwardMessageActivity$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ForwardMessageActivity;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ForwardMessageActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ForwardMessageActivity$$Lambda$1;->arg$1:Lcom/vkontakte/android/ForwardMessageActivity;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ForwardMessageActivity;)Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ForwardMessageActivity$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ForwardMessageActivity$$Lambda$1;-><init>(Lcom/vkontakte/android/ForwardMessageActivity;)V

    return-object v0
.end method


# virtual methods
.method public onItemSelected(Lcom/vkontakte/android/DialogEntry;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ForwardMessageActivity$$Lambda$1;->arg$1:Lcom/vkontakte/android/ForwardMessageActivity;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ForwardMessageActivity;->lambda$onCreate$0(Lcom/vkontakte/android/DialogEntry;)V

    return-void
.end method
