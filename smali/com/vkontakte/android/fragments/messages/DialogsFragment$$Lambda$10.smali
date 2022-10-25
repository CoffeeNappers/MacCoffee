.class final synthetic Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$10;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final instance:Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$10;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$10;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$10;-><init>()V

    sput-object v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$10;->instance:Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$10;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Ljava/lang/Runnable;
    .locals 1

    sget-object v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$10;->instance:Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$10;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 0
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    invoke-static {}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->lambda$null$8()V

    return-void
.end method
