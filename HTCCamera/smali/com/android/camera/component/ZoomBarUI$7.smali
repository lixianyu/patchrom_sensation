.class Lcom/android/camera/component/ZoomBarUI$7;
.super Ljava/lang/Object;
.source "ZoomBarUI.java"

# interfaces
.implements Lcom/android/camera/IEventHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/component/ZoomBarUI;->registerListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/component/ZoomBarUI;


# direct methods
.method constructor <init>(Lcom/android/camera/component/ZoomBarUI;)V
    .locals 0
    .parameter

    .prologue
    .line 273
    iput-object p1, p0, Lcom/android/camera/component/ZoomBarUI$7;->this$0:Lcom/android/camera/component/ZoomBarUI;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEvent(Lcom/android/camera/Event;)V
    .locals 2
    .parameter "event"

    .prologue
    .line 276
    iget-object v0, p0, Lcom/android/camera/component/ZoomBarUI$7;->this$0:Lcom/android/camera/component/ZoomBarUI;

    const/4 v1, 0x1

    #setter for: Lcom/android/camera/component/ZoomBarUI;->m_UIOpen:Z
    invoke-static {v0, v1}, Lcom/android/camera/component/ZoomBarUI;->access$902(Lcom/android/camera/component/ZoomBarUI;Z)Z

    .line 277
    return-void
.end method
