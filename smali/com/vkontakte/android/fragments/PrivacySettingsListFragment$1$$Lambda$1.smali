.class final synthetic Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/data/Friends$GetUsersCallback;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;

.field private final arg$2:Ljava/util/ArrayList;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;Ljava/util/ArrayList;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1$$Lambda$1;->arg$2:Ljava/util/ArrayList;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;Ljava/util/ArrayList;)Lcom/vkontakte/android/data/Friends$GetUsersCallback;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;Ljava/util/ArrayList;)V

    return-object v0
.end method


# virtual methods
.method public onUsersLoaded(Ljava/util/ArrayList;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1$$Lambda$1;->arg$2:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment$1;->lambda$success$1(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    return-void
.end method
