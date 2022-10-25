.class final synthetic Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$9;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/DialogEntry;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/DialogEntry;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$9;->arg$1:Lcom/vkontakte/android/DialogEntry;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/DialogEntry;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$9;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$9;-><init>(Lcom/vkontakte/android/DialogEntry;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$9;->arg$1:Lcom/vkontakte/android/DialogEntry;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->lambda$createShortcut$9(Lcom/vkontakte/android/DialogEntry;)V

    return-void
.end method
