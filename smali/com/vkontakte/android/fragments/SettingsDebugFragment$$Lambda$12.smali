.class final synthetic Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$12;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v7/preference/Preference$OnPreferenceClickListener;


# static fields
.field private static final instance:Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$12;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$12;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$12;-><init>()V

    sput-object v0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$12;->instance:Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$12;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Landroid/support/v7/preference/Preference$OnPreferenceClickListener;
    .locals 1

    sget-object v0, Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$12;->instance:Lcom/vkontakte/android/fragments/SettingsDebugFragment$$Lambda$12;

    return-object v0
.end method


# virtual methods
.method public onPreferenceClick(Landroid/support/v7/preference/Preference;)Z
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    invoke-static {p1}, Lcom/vkontakte/android/fragments/SettingsDebugFragment;->lambda$onCreate$12(Landroid/support/v7/preference/Preference;)Z

    move-result v0

    return v0
.end method
